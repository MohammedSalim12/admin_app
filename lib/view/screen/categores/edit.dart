import 'package:admen_app/controller/categores/edit_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/constant/appcolor.dart';
import 'package:admen_app/core/function/validinput.dart';
import 'package:admen_app/core/shared/coustemtextformglobal.dart';
import 'package:admen_app/core/shared/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CatergoresEditcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Categories')),
      body: GetBuilder<CatergoresEditcontroller>(
        builder: (controller) => Handingdataview(statusRequest: controller.statusRequest!, widget: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                  hintxt: "inbut categores name ",
                  labeltext: "categories name ",
                  isNumber: false,
                  iconData: Icons.category,
                  mycontroller: controller.name,
                  validator: (val) {
                    return validInput(val!, 1, 55, "");
                  },
                ),
                CustomTextFormGlobal(
                  hintxt: "inbut categores name in Arabic",
                  labeltext: "categories namear ",
                  isNumber: false,
                  iconData: Icons.category,
                  mycontroller: controller.namear,
                  validator: (val) {
                    return validInput(val!, 1, 55, "");
                  },
                ),
                MaterialButton(
                  color: Appcolor.therdcolor,
                  onPressed: () {
                    controller.chooseImage();
                  },
                  child: Text("choose categories image"),
                ),
                if(controller.file != null)
                 SvgPicture.file(controller.file!),
                CustomButtom(
                  text: "save editing",
                  onPressed: () {
                    controller.editData();
                  },
                ),
              ],
            ),
          ),
        ),)
      ),
    );
  }
}
