import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speed_test_app/app/core/utils/scroll_behavior.dart';
import 'package:speed_test_app/app/data/services/storage/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:speed_test_app/app/modules/home/global/binding.dart';
import 'package:speed_test_app/app/modules/home/global/view.dart';
import 'package:google_fonts/google_fonts.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
}

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Speedtest",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: GlobalPage(),
      initialBinding: GlobalBinding(),
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = ScrollConfiguration(behavior: MyBehavior(), child: child);
        return child;
      },
    );
  }
}
