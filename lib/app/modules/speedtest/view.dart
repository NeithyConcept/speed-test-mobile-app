import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/core/values/sizes.dart';
import 'package:speed_test_app/app/modules/home/widgets/text_info.dart';
import 'package:speed_test_app/app/modules/home/widgets/top_app_bar.dart';
import 'package:speed_test_app/app/modules/settings/controller.dart';
import 'package:speed_test_app/app/modules/speedtest/controller.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';
import 'package:speed_test_app/app/modules/speedtest/widgets/build_gauge.dart';
import 'package:speed_test_app/app/modules/speedtest/widgets/network_info.dart';
import 'package:speed_test_app/app/widgets/button_builder.dart';

class SpeedtestPage extends GetView<SpeedtestController> {

  final settingsController = Get.find<SettingsController>();

  SpeedtestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              TopAppBar(
                  title: "Speedtest",
                  divider: false,
                  icon: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close),
                  )
              ),
              Padding(
                padding: container,
                child: Container(
                  padding: EdgeInsets.all(5.0.wp),
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //language
                      NetworkInfo(
                        icon: const Icon(Icons.router_outlined, color: Colors.white, size: 35),
                        color: accent,
                        label: "Server",
                        value: settingsController.getNameServer()
                      ),
                      NetworkInfo(
                        icon: const Icon(Icons.router_outlined, color: Colors.white, size: 35),
                        label: "Location",
                        value: settingsController.getLocationCity()
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0.wp),
              BuildGauge(),
              Obx(() => Padding(
                  padding: container,
                  child: controller.isStarted.value ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          spacing: 3.0.wp,
                          children: [
                            const Icon(Icons.south_outlined),
                            TextInfo(label: "Download", text: "${controller.transferRate.value} Mbps"),
                          ],
                        ),
                        Wrap(
                          spacing: 3.0.wp,
                          children: [
                            const Icon(Icons.north_outlined),
                            TextInfo(label: "Upload", text: "${controller.transferRate.value-7.6} Mbps")
                          ],
                        )
                      ],
                    )
                  : ButtonBuilder("Start Test",
                    onPressed: () => controller.launchTest(),
                    width: 35.0.wp,
                    paddingVertical: 2.0.wp,
                    backgroundColor: Colors.white,
                    color: primary,
                    border: const BorderSide(color: primary, width: 2),
                  ),
                )),
              SizedBox(height: 10.0.wp),
              Padding(
                padding: container,
                child: Column(
                  children: [
                    Text("Speedtest Global", style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2.0.wp),
                    Text("Fint out how your country's internet ranks on\n the Speedtest Global",
                        style: TextStyle(fontSize: 10.0.sp, color: Colors.grey), textAlign: TextAlign.center),
                    SizedBox(height: 5.0.wp),
                    ButtonBuilder("See Ranking")
                  ],
                ),
              ),
              SizedBox(height: 10.0.wp),
            ],
          ),
        ),
      ),
    );
  }


}