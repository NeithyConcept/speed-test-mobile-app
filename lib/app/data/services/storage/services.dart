import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speed_test_app/app/core/values/keys.dart';

class StorageService extends GetxService {

  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.write(speedtestKey, []);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }

}