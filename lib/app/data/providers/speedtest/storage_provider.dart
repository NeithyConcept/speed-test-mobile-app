import 'dart:convert';

import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/keys.dart';
import 'package:speed_test_app/app/data/models/speedtest.dart';
import 'package:speed_test_app/app/data/services/storage/services.dart';

class SpeedtestStorageProvider {

  final StorageService _storage = Get.find<StorageService>();

  List<Speedtest> readSpeedtest() {
    var speedtests = <Speedtest>[];

    jsonDecode(_storage.read(speedtestKey).toString())
        .forEach((e) => speedtests.add(Speedtest.fromJson(e)));

    return speedtests;

  }

  void writeSpeedtests(List<Speedtest> speedtests) {
    _storage.write(speedtestKey, jsonEncode(speedtests));
  }

}