import 'package:get/get.dart';

class SpeedtestController extends GetxController {

  final isStarted = false.obs;

  final transferRate = 0.0.obs;

  SpeedtestController();

  void changeTransferRate(double value) {
    transferRate.value = value;
  }

  void launchTest() {
    isStarted.value = true;
    changeTransferRate(73.5);
  }

}