import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:sport_flutter_app/core/entity/device_info.dart';
import 'package:sport_flutter_app/core/services/device_info/device_info_service.dart';

class DeviceInfoServiceImpl implements DeviceInfoService {
  final DeviceInfoPlugin _plugin;

  DeviceInfoServiceImpl(this._plugin);

  DeviceInfo? _cached;

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    if (_cached != null) return _cached!;

    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return _cached = DeviceInfo(
        platform: 'android',
        osVersion: info.version.release,
        model: info.model,
        name: '${info.manufacturer} ${info.name}',
      );
    } else if (Platform.isIOS) {
      final info = await _plugin.iosInfo;
      return _cached = DeviceInfo(
        platform: 'ios',
        osVersion: info.systemVersion,
        model: info.utsname.machine,
        name: info.name,
      );
    } else {
      final info = await _plugin.webBrowserInfo;
      return _cached = DeviceInfo(
        platform: 'web',
        osVersion: info.platform ?? 'unknown',
        model: info.browserName.name,
        name: info.vendor ?? 'unknown',
      );
    }
  }
}
