import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/core/values/sizes.dart';
import 'package:speed_test_app/app/modules/global/controller.dart';
import 'package:speed_test_app/app/modules/home/widgets/top_app_bar.dart';
import 'package:speed_test_app/app/modules/settings/controller.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';

class SettingsPage extends GetView<SettingsController> {

  final globalController = Get.find<GlobalController>();

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              TopAppBar(
                  title: "Settings",
                  icon: GestureDetector(
                    onTap: () => globalController.changePageIndex(0),
                    child: const Icon(Icons.close),
                  )
              ),
              Obx(() => Padding(
                padding: container,
                child: Container(
                  padding: EdgeInsets.all(7.0.wp),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.wifi, size: 50),
                          GestureDetector(
                            onTap: () => controller.loadNetworkData(),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1.0.wp, horizontal: 3.0.wp),
                              decoration: BoxDecoration(
                                  color: secondary,
                                  borderRadius: BorderRadius.circular(26)
                              ),
                              child: Text("Change Server",
                                  style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5.0.wp),
                      Row(
                        children: [Text(controller.getNameServer(), style: TextStyle(fontSize: 20.0.sp))],
                      ),
                      SizedBox(height: 3.0.wp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Current Connection", style: TextStyle(fontSize: 10.0.sp, color: Colors.grey)),
                          Text(controller.getIp(), style: TextStyle(fontSize: 13.0.sp))
                        ],
                      ),
                      SizedBox(height: 3.0.wp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Latitude ${controller.getLocationLatitude()}', style: TextStyle(fontSize: 13.0.sp)),
                          Text('Longitude ${controller.getLocationLongitude()}', style: TextStyle(fontSize: 13.0.sp))
                        ],
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(height: 10.0.wp),
              Padding(
                padding: container,
                child: Column(
                  children: [
                    Row(
                      children: [Text("Global Settings",
                          style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w900)),],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 7.5.wp),
              Padding(
                padding: container,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 8.0.wp,
                  children: [
                    buildRowGlobalSettings("Time", "24-hour"),
                    buildRowGlobalSettings("Date", "MM/DD/YYYY"),
                    buildRowGlobalSettings("Distance", "Miles"),
                    buildRowGlobalSettings("Speed", "Mbps"),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Row buildRowGlobalSettings(String title, String placeholder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w900)),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5.0.wp,
          children: [
            Text(placeholder,
                style: TextStyle(fontSize: 12.0.sp, color: Colors.grey)),
            Icon(Icons.east_outlined, size: 18.0.sp)
          ],
        )
      ],
    );
  }



}