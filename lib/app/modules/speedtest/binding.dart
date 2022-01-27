import 'package:get/get.dart';
import 'package:speed_test_app/app/modules/speedtest/controller.dart';

class SpeedtestBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SpeedtestController>(() => SpeedtestController());
  }

}