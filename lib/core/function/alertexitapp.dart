import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  return await Get.defaultDialog(
    title: "worning",
    middleText: "do you need exit from this app ?",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("Yes"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("No"),
      ),
    ],
  );
}
