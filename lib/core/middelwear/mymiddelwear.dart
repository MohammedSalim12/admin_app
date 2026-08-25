import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddelware extends GetMiddleware {
  int? get Priority => 1;

  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
       return RouteSettings(name: Approutes.home);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: Approutes.login);
     }
      
    return null;
  }
}
