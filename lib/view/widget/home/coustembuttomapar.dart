import 'package:admen_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class Coustembuttomappar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? icondata;
  final bool active;

  const Coustembuttomappar({
    Key? key,
    this.onPressed,
    required this.text,
    this.icondata,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
        child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icondata,
              color: active == true ? Appcolor.primaryColor : Appcolor.black,
            ),
            Text(
              text,
              style: TextStyle(
                color: active == true ? Appcolor.primaryColor : Appcolor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
