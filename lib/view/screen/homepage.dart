import 'package:admen_app/controller/homepage_controller.dart';
import 'package:admen_app/core/constant/appimages.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomepageController controller = Get.put(HomepageController());
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 150,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            children: [
              Cardadmin(
                text: "Users",
                image: AppImagesset.avatar,
                onTap: () {},
              ),
              Cardadmin(
                text: "Categores",
                image: AppImagesset.avatar,
                onTap: () {
                  Get.toNamed(Approutes.categoresview);
                },
              ),
              Cardadmin(
                text: "Report",
                image: AppImagesset.avatar,
                onTap: () {},
              ),
              Cardadmin(
                text: "Orders",
                image: AppImagesset.avatar,
                onTap: () {},
              ),
              Cardadmin(
                text: "items",
                image: AppImagesset.avatar,
                onTap: () {
                  Get.toNamed(Approutes.itemsview);
                },
              ),
              Cardadmin(
                text: "Notification",
                image: AppImagesset.avatar,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
