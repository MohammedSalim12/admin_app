import 'package:admen_app/controller/items/edit_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/constant/appcolor.dart';
import 'package:admen_app/core/function/validinput.dart';
import 'package:admen_app/core/shared/coustemtextformglobal.dart';
import 'package:admen_app/core/shared/custombutton.dart';
import 'package:admen_app/core/shared/customdropdownserche.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItems extends StatelessWidget {
  const EditItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsEditcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Edit items')),
      body: GetBuilder<ItemsEditcontroller>(
        builder: (controller) => Handingdataview(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintxt: "edit Item name ",
                    labeltext: "item name ",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit item name in Arabic",
                    labeltext: "item namear ",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit desc for item",
                    labeltext: "item desc",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.desc,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit desc for item in Arabic",
                    labeltext: "item descar",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.descar,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit item count",
                    labeltext: "item count ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.count,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit item price",
                    labeltext: "item price ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.price,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "edit item discount",
                    labeltext: "item discount ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.discount,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  SizedBox(height: 10),
                  RadioListTile(
                    title: Text("hide"),
                    value: "0",
                    groupValue: controller.active,
                    onChanged: (val) {
                      controller.changeStateActive(val);
                    },
                  ),
                  RadioListTile(
                    title: Text("active"),

                    value: "1",
                    groupValue: controller.active,
                    onChanged: (val) {
                      controller.changeStateActive(val);
                    },
                  ),
                  SizedBox(height: 10),
                  CustomDropDownSerche(
                    title: "choose Categroies ",
                    listdata: controller.dropdownlist
                        .map(
                          (cat) => SelectedListItem(
                            data: NameIdItem(name: cat.data, id: cat.data),
                          ),
                        )
                        .toList(),
                    dropdownselectedName: controller.catName!,
                    dropdownselectedId: controller.catId!,
                  ),
                  MaterialButton(
                    color: Appcolor.therdcolor,
                    onPressed: () {
                      // controller.showOptionImage();
                    },
                    child: Text("choose item image"),
                  ),
                  SizedBox(height: 10),

                  if (controller.file != null)
                    Image.file(controller.file!, width: 100, height: 100),
                  CustomButtom(
                    text: "Editing",
                    onPressed: () {
                      controller.editData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
