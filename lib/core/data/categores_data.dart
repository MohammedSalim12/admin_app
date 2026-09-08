import 'dart:io';

import 'package:admen_app/core/class/curd.dart';
import 'package:admen_app/linkapi.dart';
import 'package:dio/dio.dart';

class CategoresData {
  Dio dio;
  CategoresData(this.dio);

  viewdData() async {
    var respons = await dio.get("${Applink.categoresview}");

    return respons.data;
  }

  addData(Map data, File file) async {
    var crud = Crud();
    var respons = await crud.addRequestWithImageOne(
      Applink.categoresadd,
      data,
      file,
    );

    return respons;
  }

  delete(Map data) async {
    var respons = await dio.post("${Applink.categoresdelete}?$data");
    return respons;
  }

  edit(Map data, [File? file]) async {
    var respons;
    if (file == null) {
       respons = await dio.post("${Applink.categoresedit}?$data");
    } else {
      var crud = Crud();
       respons = await crud.addRequestWithImageOne(Applink.categoresedit , data , file); 
    }
    return respons;
  }
}
