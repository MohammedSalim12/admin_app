import 'dart:io';
import 'package:admen_app/controller/homescreenController.dart';
import 'package:admen_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';  

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenController());
    return GetBuilder<HomescreenController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'orders',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(color: Appcolor.grey),
          ),
        ),
        body: WillPopScope(
          child: controller.listpage.elementAt(controller.currentpage),
          onWillPop: () {
            Get.defaultDialog(
              title: "warning",
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              middleText: "Do you want to exit the app",
              onConfirm: () {
                exit(0);
              },
              buttonColor: Appcolor.primaryColor,
              onCancel: () {},
            );
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
