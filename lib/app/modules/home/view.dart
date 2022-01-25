import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';
import 'package:speed_test_app/app/widgets/button_builder.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';

class HomePage extends GetView<HomeController> {

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container()
      ),
    );
  }

}