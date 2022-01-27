import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/modules/speedtest/controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BuildGauge extends StatelessWidget {

  final speedtestController = Get.find<SpeedtestController>();

  BuildGauge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SfRadialGauge(
      key: UniqueKey(),
      axes: [
        RadialAxis(
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
              thickness: 40,
              color: Colors.grey[300]
          ),
        ),
        RadialAxis(
          pointers: [
            NeedlePointer(
              value: speedtestController.transferRate.value,
              knobStyle: const KnobStyle(
                  knobRadius: 0.041
              ),
              needleEndWidth: 7,
              needleLength: 0.4,
              enableAnimation: true,
            ),
            const NeedlePointer(
              knobStyle: KnobStyle(
                  color: Colors.white,
                  knobRadius: 0.015
              ),
              needleLength: 0,
            ),
            RangePointer(
              value: speedtestController.transferRate.value,
              color: primary,
              width: 50,
              enableAnimation: true,
            )
          ],
          showTicks: false,
          axisLabelStyle: const GaugeTextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          labelOffset: 25,
          axisLineStyle: const AxisLineStyle(
              thickness: 50,
              color: Colors.transparent
          ),
        ),
      ],
    ));
  }
}
