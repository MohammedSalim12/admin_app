import 'dart:io';
import 'package:admen_app/core/constant/appcolor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imagesUploadCamera() async {
  final XFile? file = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  if (file != null) {
    return (file.path);
  } else {
    return null;
  }
}

fileuploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["svg", "SVG"]
        : ["svg", "SVG", "png", "PNG", "jpg", "jpeg", "gif"],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showbottommenu(imagesUploadCamera(), fileuploadGallery()) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "choose photo",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.primaryColor,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imagesUploadCamera();
                Get.back();
              },
              leading: Icon(Icons.camera, size: 40),
              title: Text("photo in camera ", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              onTap: () {
                fileuploadGallery();
                Get.back();
              },
              leading: Icon(Icons.image, size: 40),
              title: Text("photo from Gallery", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
