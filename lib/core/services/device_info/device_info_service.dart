import 'package:sport_flutter_app/core/entity/device_info.dart';

abstract class DeviceInfoService {
  Future<DeviceInfo> getDeviceInfo();
}
