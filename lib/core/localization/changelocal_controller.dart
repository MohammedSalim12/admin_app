import 'package:admen_app/core/constant/themeapp.dart';
import 'package:admen_app/core/function/fcmconfiy.dart';
import 'package:admen_app/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localecontroller extends GetxController {
  Locale? language;
  Myservices myservices = Get.find();

  ThemeData apptheme = themeEnglish;
  changeLand(String langcode) {
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myservices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      apptheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = Locale("en"); 
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish;
    }
    super.onInit();
  }
}
