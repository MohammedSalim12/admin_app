import 'package:flutter/material.dart';

class Coustemtextauthtitle extends StatelessWidget {
  final String text;
  const Coustemtextauthtitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
     style: Theme.of(context).textTheme.headlineMedium,
     textAlign: TextAlign.center,
     
     );
  }
}
