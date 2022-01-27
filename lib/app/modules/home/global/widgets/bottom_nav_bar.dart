import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/modules/home/global/controller.dart';

class BottomNavBar extends StatelessWidget {

  final controller = Get.find<GlobalController>();

  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200]!))
        ),
        child: Obx(() => BottomNavigationBar(
          onTap: (int index) =>  controller.changePageIndex(index),
          elevation: 0,
          currentIndex: controller.pageIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: true,
          unselectedItemColor: primary,
          selectedItemColor: accent,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                label: 'home',
                tooltip: "",
                icon: Icon(Icons.cottage_outlined)
            ),
            BottomNavigationBarItem(
                label: 'statistics',
                tooltip: "",
                icon: Icon(Icons.bar_chart)
            ),
            BottomNavigationBarItem(
                label: '',
                tooltip: "",
                icon: Icon(Icons.arrow_upward_outlined, color: Colors.transparent)
            ),
            BottomNavigationBarItem(
                label: 'history',
                tooltip: "",
                icon: Icon(Icons.check_circle_outlined)
            ),
            BottomNavigationBarItem(
                label: 'settings',
                tooltip: "",
                icon: Icon(Icons.settings_outlined)
            )
          ],
        ))
    );
  }
}
