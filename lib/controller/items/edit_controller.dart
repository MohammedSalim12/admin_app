import 'dart:io';
import 'package:admen_app/controller/items/view_controller.dart';
import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/items_data.dart';
import 'package:admen_app/core/data/model/itemsmodel.dart';
import 'package:admen_app/core/function/handlingdatacontroller.dart';
import 'package:admen_app/core/function/uploadfile.dart';
import 'package:dio/dio.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditcontroller extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<SelectedListItem<String>> dropdownlist = [];

  late TextEditingController name;
  late TextEditingController namear;

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catId;
  TextEditingController? catName;
  ItemsData itemsData = ItemsData(Dio());
  File? file;

  String? active;

  Itemsmodel? itemsmodel;

  changeStateActive(val) {
    active = val;
    update();
  }

  chooseImage() async {
    file = await fileuploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      Map data = {
        "id": itemsmodel!.itemsId,
        "image": itemsmodel!.itemsImage,
        "active" : active,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catId!.text,
        "datenow": DateTime.now().toString(),
      };

      var response = await itemsData.edit(data, file);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(Approutes.itemsview);
          ItemsViewcontroller c = Get.find();
          c.getview();
        } else {
          statusRequest = StatusRequest.failuor;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsmodel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();

    catId = TextEditingController();
    catName = TextEditingController();

    dropdownname = TextEditingController();
    dropdownid = TextEditingController();

    name.text = itemsmodel!.itemsName!;
    namear.text = itemsmodel!.itemsNameAr!;

    active = itemsmodel!.itemsActive;

    desc.text = itemsmodel!.itemsDesc!;
    descar.text = itemsmodel!.itemsDescAr!;

    price.text = itemsmodel!.itemsPrice!;
    count.text = itemsmodel!.itemsCount!;
    discount.text = itemsmodel!.itemsDiscount!;

    catId!.text = itemsmodel!.categoriesId!;
    catName!.text = itemsmodel!.categoriesName!;

    super.onInit();
  }
}
