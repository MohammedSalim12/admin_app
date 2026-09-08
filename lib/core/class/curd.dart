import 'dart:convert';
import 'dart:io';
import 'package:admen_app/core/class/statusRequest.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode('dddd:sd'))}';
Map<String, String> _myheaders = {
  'authorization': _basicAuth
  };

class Crud {
  final Dio _dio = Dio();

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      Response response = await _dio.post(url, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      } else {
        return const Left(StatusRequest.serverfailuor);
      }
    } on DioException catch (e) {
      // خطأ من السيرفر أو من Dio
      return const Left(StatusRequest.serverfailuor);
    } catch (e) {
      // خطأ غير متوقع
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
    url,
    data,
    File? image, [
    String? namerequest,
  ]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    try {
      var dio = Dio();

      // تجهيز الـ FormData
      Map<String, dynamic> formMap = {};

      // إضافة بيانات الـ data العادية
      data.forEach((key, value) {
        formMap[key] = value;
      });

      // إضافة الصورة إذا موجودة
      if (image != null) {
        formMap[namerequest] = await MultipartFile.fromFile(
          image.path,
          filename: basename(image.path),
        );
      }

      var formData = FormData.fromMap(formMap);

      var response = await dio.post(
        url,
        data: formData,
        options: Options(headers: _myheaders),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        Map responsebody = response.data is String
            ? jsonDecode(response.data)
            : response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailuor);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        return const Left(StatusRequest.serverfailuor);
      } else {
        return const Left(StatusRequest.offlinefailuor);
      }
    }
  }
}
