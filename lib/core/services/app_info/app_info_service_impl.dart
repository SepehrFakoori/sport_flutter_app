import 'package:package_info_plus/package_info_plus.dart';
import 'package:sport_flutter_app/core/entity/app_info.dart';
import 'package:sport_flutter_app/core/services/app_info/app_info_service.dart';

class AppInfoServiceImpl implements AppInfoService {
  AppInfo? _cached;

  @override
  Future<AppInfo> getAppInfo() async {
    if (_cached != null) return _cached!;

    final info = await PackageInfo.fromPlatform();
    return _cached = AppInfo(
      name: info.appName,
      packageName: info.packageName,
      version: info.version,
      buildNumber: info.buildNumber,
    );
  }
}
