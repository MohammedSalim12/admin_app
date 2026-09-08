import 'package:flutter/material.dart';

class Cardadmin extends StatelessWidget {
  final Function()? onTap;
  final String image;
  final String text;
  const Cardadmin({Key? key, this.onTap, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(image, width: 80), Text(text)],
        ),
      ),
    );
  }
}
