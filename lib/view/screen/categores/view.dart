import 'package:admen_app/controller/categores/view_controller.dart';
import 'package:admen_app/core/class/handlingdataview.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoresView extends StatelessWidget {
  const CategoresView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CatergoresViewcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Approutes.categoresadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<CatergoresViewcontroller>(
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
                                    "${Applink.imagescategories}/${controller.data[index].categoriesImage}",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
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
                                          controller.deleteCategories(
                                            controller
                                                .data[index]
                                                .categoriesId!,
                                            controller
                                                .data[index]
                                                .categoriesImage!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                controller.data[index].categoriesDatetime!,
                              ),
                              title: Text(
                                controller.data[index].categoriesName!,
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
