import 'package:flutter/material.dart';

class Coustemtextbodyauth extends StatelessWidget {
  final String textbody;
  const Coustemtextbodyauth({Key? key, required this.textbody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textbody ,style: Theme.of(context).textTheme.bodyLarge,
    textAlign: TextAlign.center,
    );
  }
}
