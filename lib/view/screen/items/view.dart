import 'package:admen_app/controller/items/view_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Approutes.itemsadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewcontroller>(
        builder: (controller) => Handingdataview(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.myBack();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goTOPageEdit(controller.data[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${Applink.imagesitems}/${controller.data[index].itemsImage}",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "Warning",
                                        middleText: "هل انت متاكد من الحذف ؟",
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteItmes(
                                            controller.data[index].itemsId!,
                                            controller.data[index].itemsImage!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              subtitle: Text(controller.data[index].itemsDate!),
                              title: Text(
                                controller.data[index].itemsName!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
