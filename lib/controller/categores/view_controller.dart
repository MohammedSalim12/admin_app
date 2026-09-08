import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/nameroute.dart';
import 'package:admen_app/core/data/categores_data.dart';
import 'package:admen_app/core/data/model/categoresmodel.dart';
import 'package:admen_app/core/function/handlingdatacontroller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CatergoresViewcontroller extends GetxController {
  late StatusRequest statusRequest;
  List<CategoriesModel> data = [];
  CategoresData categoresData = CategoresData(Dio());

  getview() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoresData.viewdData();

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  deleteCategories(String id, String imageName) {
    categoresData.delete({"categories_id": id, "categoreis_images": imageName});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goTOPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(
      Approutes.categoresedit,
      arguments: {"categoriesModel": categoriesModel},
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
