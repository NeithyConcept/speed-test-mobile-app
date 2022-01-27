

import 'package:get/get.dart';
import 'package:speed_test_app/app/data/providers/speedtest/storage_provider.dart';
import 'package:speed_test_app/app/data/services/storage/repository.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';
import 'package:speed_test_app/app/modules/global/controller.dart';
import 'package:speed_test_app/app/modules/settings/controller.dart';

class GlobalBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<HomeController>(() => HomeController(
        speedtestRepository: SpeedtestRepository(
          speedtestStorageProvider: SpeedtestStorageProvider())));
    Get.lazyPut<SettingsController>(() => SettingsController());
  }

}