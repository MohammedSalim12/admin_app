import 'package:admen_app/linkapi.dart';
import 'package:dio/dio.dart';

class LoginData {
  Dio dio;
  LoginData(this.dio);

  postData(String email, String password) async {
    var response = await dio.post(
      "${Applink.login}?email=$email&password=$password",
    );
    return response;
  }
}
