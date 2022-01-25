import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speed_test_app/app/data/services/storage/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:speed_test_app/app/modules/home/binding.dart';
import 'package:speed_test_app/app/modules/home/view.dart';
import 'package:google_fonts/google_fonts.dart';

main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Speedtest",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily
      ),
      home: const HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
