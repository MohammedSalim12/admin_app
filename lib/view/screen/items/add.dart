import 'package:admen_app/controller/items/add_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/constant/appcolor.dart';
import 'package:admen_app/core/function/validinput.dart';
import 'package:admen_app/core/shared/coustemtextformglobal.dart';
import 'package:admen_app/core/shared/custombutton.dart';
import 'package:admen_app/core/shared/customdropdownserche.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Add items')),
      body: GetBuilder<ItemsAddcontroller>(
        builder: (controller) => Handingdataview(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    hintxt: "inbut Item name ",
                    labeltext: "item name ",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    validator: (val) {
                      return validInput(val!, 1, 55, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut item name in Arabic",
                    labeltext: "item namear ",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    validator: (val) {
                      return validInput(val!, 1, 55, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut desc for item",
                    labeltext: "item desc",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.desc,
                    validator: (val) {
                      return validInput(val!, 1, 55, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut desc for item in Arabic",
                    labeltext: "item descar",
                    isNumber: false,
                    iconData: Icons.category,
                    mycontroller: controller.descar,
                    validator: (val) {
                      return validInput(val!, 1, 55, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut item count",
                    labeltext: "item count ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.count,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut item price",
                    labeltext: "item price ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.price,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
                  CustomTextFormGlobal(
                    hintxt: "inbut item discount",
                    labeltext: "item discount ",
                    isNumber: true,
                    iconData: Icons.category,
                    mycontroller: controller.discount,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                  ),
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
                      controller.showOptionImage();
                    },
                    child: Text("choose item image"),
                  ),
                  SizedBox(height: 10),

                  if (controller.file != null)
                    Image.file(controller.file! , width: 100 , height: 100,),
                  CustomButtom(
                    text: "adding",  
                    onPressed: () {
                      controller.addData();
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
