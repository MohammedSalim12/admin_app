import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/auth/login_data.dart';
import 'package:admen_app/core/services/myservices.dart';
import 'package:admen_app/linkapi.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Myservices myserveies = Get.find();
  Dio dio = Dio();
  LoginData loginData = LoginData(Dio());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusrequest = StatusRequest.none;
  bool isshowpasswoed = true;

  showPassword() {
    isshowpasswoed = isshowpasswoed == true ? false : true;
    update();
  }

  login() async {
    try {
      statusrequest = StatusRequest.loading;
      update();
      print("EMAIL: ${email.text}");
      print("PASSWORD: ${password.text}");
      print("LOGIN URL: ${Applink.login}");

      var response = await loginData.postData(email.text, password.text);
      print("LOGIN RESPONSE: $response");

      if (response["status"] == "success") {
        statusrequest = StatusRequest.success;

        var data = response['data']; // ✅ هون الداتا الفعلية

        if (data['admin_approve'] == 1) {
          myserveies.sharedPreferences.setString(
            "adminid",
            data["admin_id"].toString(),
          );
          String adminid = myserveies.sharedPreferences.getString(
            "adminid",
          )!;

          myserveies.sharedPreferences.setString(
            "adminname",
            data["admin_name"],
          );
          myserveies.sharedPreferences.setString(
            "adminemail",
            data["admin_email"],
          );
          myserveies.sharedPreferences.setString(
            "adminphone",
            data["admin_phone"],
          );
          myserveies.sharedPreferences.setString("step", "2");

          FirebaseMessaging.instance.subscribeToTopic("admin");
          FirebaseMessaging.instance.subscribeToTopic("admin$adminid");

          Get.offNamed(Approutes.homescreen);
        } else {
          Get.snackbar("تنبيه", "الحساب غير مفعّل بعد");
        }
      } else {
        Get.snackbar("خطأ", response["message"] ?? "بيانات خاطئة");
        statusrequest = StatusRequest.failuor;
      }
    } catch (e) {
      print("LOGIN CATCH ERROR: $e");
      statusrequest = StatusRequest.serverfailuor;
      update();
      Get.snackbar("خطأ", "فشل الاتصال بالسيرفر");
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
