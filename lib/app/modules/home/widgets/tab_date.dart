
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';

class TabDate extends StatelessWidget {

  final homeController = Get.find<HomeController>();

  TabDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            alignment: homeController.getTab(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
              width: 88.0.wp/3,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(26)
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homeController.tab.asMap().entries.map((entry) {
                Color? color = entry.key == homeController.tabIndex.value
                    ? Colors.white : Colors.grey[400];

                return Align(
                  alignment: homeController.getTab(index: entry.key),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => homeController.changeTabIndex(entry.key),
                    child: Container(
                      width: 88.0.wp/3,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(entry.value, style: TextStyle(
                          color: color, fontSize: 12.0.sp),
                          textAlign: TextAlign.center),
                    ),
                  ),
                );

              }).toList()
          ),
        ]
    ));
  }
}
