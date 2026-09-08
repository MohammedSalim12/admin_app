import 'package:admen_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintxt;
  final String labeltext;
  final bool isNumber;
  final bool? obsecuretext;
  final IconData? iconData;
  final void Function()? onTap;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;

  const CustomTextFormAuth({
    Key? key,
    required this.hintxt,
    required this.labeltext,
    required this.isNumber,
    this.obsecuretext,
    required this.mycontroller,
    this.iconData,
    this.onTap, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: TextFormField(
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: validator,
        controller: mycontroller,
        obscureText: obsecuretext == null || obsecuretext == false
            ? false
            : true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text(labeltext),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(iconData, size: 20, color: Appcolor.grey),
          ),
          hint: Text(hintxt, style: Theme.of(context).textTheme.bodyMedium),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
