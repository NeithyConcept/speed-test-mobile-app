

import 'package:get/get.dart';
import 'package:speed_test_app/app/data/providers/speedtest/storage_provider.dart';
import 'package:speed_test_app/app/data/services/storage/repository.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        speedtestRepository: SpeedtestRepository(
          speedtestStorageProvider: SpeedtestStorageProvider()
        )
    ));
  }
  
}