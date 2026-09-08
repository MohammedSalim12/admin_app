
import 'package:admen_app/core/class/statusRequest.dart';
import 'package:admen_app/core/constant/appimages.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Handingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handingdataview({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImagesset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailuor
        ? Center(
            child: Lottie.asset(AppImagesset.offline, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.serverfailuor
        ? Center(
            child: Lottie.asset(AppImagesset.offline, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.failuor
        ? Center(
            child: Lottie.asset(AppImagesset.noData, width: 250, height: 250),
          )
        : widget;
  }
}
