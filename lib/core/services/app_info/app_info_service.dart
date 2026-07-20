import 'package:sport_flutter_app/core/entity/app_info.dart';

abstract class AppInfoService {
  Future<AppInfo> getAppInfo();
}
