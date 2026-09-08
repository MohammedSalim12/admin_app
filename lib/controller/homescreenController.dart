import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenController extends GetxController {
  int currentpage = 0;
  List<Widget> listpage = [
    // Pending(),
    // Accepted(),
    
  ];

  List titlepage = ["Pending","Acceptd",];

  List iconpage = [Icons.pending_actions_outlined, Icons.done_outline_outlined];
  changepage(int current) {
    currentpage = current;
    update();
  } 
}
