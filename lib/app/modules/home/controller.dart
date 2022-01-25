import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:speed_test_app/app/data/models/speedtest.dart';
import 'package:speed_test_app/app/data/services/storage/repository.dart';

class HomeController extends GetxController {

  SpeedtestRepository speedtestRepository;

  final tabIndex = 1.obs;
  final tab = <String>["Daily", "Weekly", "Monthly"].obs;

  final speedtests = <Speedtest>[].obs;
  final internetSpeedTest = InternetSpeedTest();

  final percentDownload = 0.0.obs;
  final transferRateDownload = 0.0.obs;
  final Rx<SpeedUnit> unitDownload = SpeedUnit.Mbps.obs;

  final percentUpload = 0.0.obs;
  final transferRateUpload = 0.0.obs;
  final Rx<SpeedUnit> unitUpload = SpeedUnit.Mbps.obs;

  HomeController({required this.speedtestRepository});

  @override
  void onInit() {
    super.onInit();
    speedtests.assignAll(speedtestRepository.readSpeedtest());
    ever(speedtests, (_) => speedtestRepository.writeSpeedtest(speedtests));
  }

  void changePercentDownload(double value) {
    percentDownload.value = value;
  }

  void changeTransferRateDownload(double value) {
    transferRateDownload.value = value;
  }

  void changeUnitDownload(SpeedUnit unit) {
    unitDownload.value = unit;
  }

  void changePercentUpload(double value) {
    percentUpload.value = value;
  }

  void changeTransferRateUpload(double value) {
    transferRateUpload.value = value;
  }

  void changeUnitUpload(SpeedUnit unit) {
    unitUpload.value = unit;
  }

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