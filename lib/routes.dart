import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/view/screen/auth/Login.dart';
import 'package:admen_app/view/screen/home.dart';
import 'package:get/get.dart';

List<GetPage>? routes = [
  GetPage(name: Approutes.login, page: () => Login()),
  GetPage(name: Approutes.home, page: () => Home()),
];
