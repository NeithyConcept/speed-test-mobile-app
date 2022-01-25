

import 'package:speed_test_app/app/data/models/speedtest.dart';
import 'package:speed_test_app/app/data/providers/speedtest/storage_provider.dart';

class SpeedtestRepository {

  SpeedtestStorageProvider speedtestStorageProvider;

  SpeedtestRepository({required this.speedtestStorageProvider});

  List<Speedtest> readSpeedtest() => speedtestStorageProvider.readSpeedtest();
  void writeSpeedtest(List<Speedtest> speedtests) => speedtestStorageProvider.writeSpeedtests(speedtests);
}