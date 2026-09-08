import 'dart:io';
import 'package:admen_app/controller/categores/view_controller.dart';
import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/categores_data.dart';
import 'package:admen_app/core/data/model/categoresmodel.dart';
import 'package:admen_app/core/function/handlingdatacontroller.dart';
import 'package:admen_app/core/function/uploadfile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatergoresEditcontroller extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController namear;
  CategoresData categoresData = CategoresData(Dio());
  File? file;

  CategoriesModel? categoriesModel;

  chooseImage() async {
    file = await fileuploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;

      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage,
        "id": categoriesModel!.categoriesId.toString(),
      };

      var response = await categoresData.edit(data, file);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(Approutes.categoresview);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    name.text = categoriesModel!.categoriesNameAr!;

    super.onInit();
  }
}
