import 'dart:io';

import 'package:admen_app/core/class/curd.dart';
import 'package:admen_app/linkapi.dart';
import 'package:dio/dio.dart';

class ItemsData {
  Dio dio;
  ItemsData(this.dio);

  viewdData() async {
    var respons = await dio.get("${Applink.itemsview}");

    return respons.data;
  }

  addData(Map data, File file) async {
    var crud = Crud();
    var respons = await crud.addRequestWithImageOne(
      Applink.itemsadd,
      data,
      file,
    );

    return respons;
  }

  delete(Map data) async {
    var respons = await dio.post("${Applink.itemsdelete}?$data");
    return respons;
  }

  edit(Map data, [File? file]) async {
    var respons;
    if (file == null) {
       respons = await dio.post("${Applink.itemsedit}?$data");
    } else {
      var crud = Crud();
       respons = await crud.addRequestWithImageOne(Applink.itemsedit , data , file); 
    }
    return respons;
  }
}
