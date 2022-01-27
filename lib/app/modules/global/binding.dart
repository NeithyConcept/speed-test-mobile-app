import 'package:get/get.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';
import 'package:speed_test_app/app/modules/global/controller.dart';
import 'package:speed_test_app/app/modules/settings/controller.dart';

class GlobalBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }

}