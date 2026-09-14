import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/items_data.dart';
import 'package:admen_app/core/data/model/itemsmodel.dart';
import 'package:admen_app/core/function/handlingdatacontroller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ItemsViewcontroller extends GetxController {
  late StatusRequest statusRequest;
  List<Itemsmodel> data = [];
  ItemsData itemsData = ItemsData(Dio());

  getview() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.viewdData();

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  deleteItmes(String id, String imageName) {
    itemsData.delete({"items_id": id, "items_images": imageName});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goTOPageEdit(Itemsmodel itemsmodel) {
    Get.toNamed(
      Approutes.itemsedit,
      arguments: {"itemsModel": itemsmodel},
    );
  }

  @override
  void onInit() {
    getview();
    super.onInit();
  }

  myBack() {
    Get.offAllNamed(Approutes.homepage);
    Future.value(false);
  }
}
