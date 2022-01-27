import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/modules/home/global/controller.dart';
import 'package:speed_test_app/app/modules/home/global/widgets/bottom_nav_bar.dart';
import 'package:speed_test_app/app/modules/home/view.dart';
import 'package:speed_test_app/app/modules/settings/view.dart';

class GlobalPage extends GetView<GlobalController> {

  const GlobalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>  IndexedStack(
        index: controller.getPageIndex(),
        children: [
          const HomePage(),
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          SettingsPage()
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primary,
        elevation: 0,
        enableFeedback: true,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(50)
            ),
            child: const Icon(Icons.arrow_upward_rounded)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar()
    );
  }

}