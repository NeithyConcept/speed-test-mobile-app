

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class Location {
  late final latitude = 0.0.obs;
  late final longitude = 0.0.obs;
}

class SettingsController extends GetxController {

  late final ip = "".obs;
  late final nameServer = "".obs;
  late final Location location = Location();

  @override
  void onInit() {
    loadNetworkData();
    super.onInit();
  }

  loadNetworkData() {
    Ipify.geo(dotenv.env['IPIFY_API_KEY']!).then((value) {
      ip.value = value.ip ?? "--.---.-.---";
      nameServer.value = value.as?.name ?? "undefined";
      location.longitude.value = value.location?.lng ?? 0;
      location.latitude.value = value.location?.lat ?? 0;
    });
  }

  String getIp() {
    return ip.value;
  }

  String getNameServer() {
    return nameServer.value;
  }

  double? getLocationLatitude() {
    return location.latitude.value;
  }

  double? getLocationLongitude() {
    return location.longitude.value;
  }

}