import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/view/screen/auth/Login.dart';
import 'package:admen_app/view/screen/categores/add.dart';
import 'package:admen_app/view/screen/categores/edit.dart';
import 'package:admen_app/view/screen/categores/view.dart';
import 'package:admen_app/view/screen/homepage.dart';
import 'package:admen_app/view/screen/homescreen.dart';
import 'package:admen_app/view/screen/items/add.dart';
import 'package:admen_app/view/screen/items/edit.dart';
import 'package:admen_app/view/screen/items/view.dart';
import 'package:get/get.dart';

List<GetPage>? routes = [
  GetPage(name: "/", page: () => Homepage()),
  GetPage(name: Approutes.login, page: () => Login()),
  GetPage(name: Approutes.homescreen, page: () => HomeScreen()),
  GetPage(name: Approutes.homepage, page: () => Homepage()),
  // categores ===================
  GetPage(name: Approutes.categoresview, page: () => CategoresView()),
  GetPage(name: Approutes.categoresadd, page: () => CategoriesAdd()),
  GetPage(name: Approutes.categoresedit, page: () => CategoriesEdit()),
  // items ================
  GetPage(name: Approutes.itemsadd, page: () => AddItems()),
  GetPage(name: Approutes.itemsview, page: () => ViewItems()),
  GetPage(name: Approutes.itemsedit, page: () => EditItems()),



];
