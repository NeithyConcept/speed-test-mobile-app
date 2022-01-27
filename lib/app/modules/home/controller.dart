import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final tabIndex = 1.obs;
  final tab = <String>["Daily", "Weekly", "Monthly"].obs;

  HomeController();

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Alignment getTab({int? index}) {
    switch(index ?? tabIndex.value) {
      case 0:
        return Alignment.centerLeft;
      case 2:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

}