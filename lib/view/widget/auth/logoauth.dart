import 'package:admen_app/core/constant/appcolor.dart';
import 'package:admen_app/core/constant/appimages.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 90,
      backgroundColor: Appcolor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipOval(child: Image.asset(AppImagesset.loading)),
      ),
    );
  }
}
