import 'dart:io';
import 'package:admen_app/controller/categores/view_controller.dart';
import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/categores_data.dart';
import 'package:admen_app/core/data/items_data.dart';
import 'package:admen_app/core/data/model/categoresmodel.dart';
import 'package:admen_app/core/function/handlingdatacontroller.dart';
import 'package:admen_app/core/function/uploadfile.dart';
import 'package:dio/dio.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddcontroller extends GetxController {
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

  showOptionImage() {
    showbottommenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imagesUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileuploadGallery(false);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "please choose Image  ");

      statusRequest = StatusRequest.loading;

      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price" : price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catId!.text,
        "datenow": DateTime.now().toString(),
      };

      var response = await itemsData.addData(data, file!);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(Approutes.itemsview);
          CatergoresViewcontroller c = Get.find();
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
    getCategories();
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

    super.onInit();
  }

  // showDropList(context) {
  //   DropDownState<String>(
  //     dropDown: DropDown<String>(
  //       data: <SelectedListItem<String>>[
  //         SelectedListItem<String>(data: 'Tokyo'),
  //         SelectedListItem<String>(data: 'New York'),
  //         SelectedListItem<String>(data: 'London'),
  //       ],
  //       onSelected: (selectedItems) {
  //         SelectedListItem selectedListItem = selectedItems[0];
  //         dropdownname.text = selectedListItem.data;

  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(selectedListItem.data.toString())),
  //         );
  //       },
  //     ),
  //   ).showModal(context);
  // }

  getCategories() async {
    CategoresData categoresData = CategoresData(Dio());

    statusRequest = StatusRequest.loading;
    update();
    var response = await categoresData.viewdData();

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(data: data[i].categoriesName!));
        }
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }
}
