import 'package:admen_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtom({Key? key, required this.text, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: Appcolor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
