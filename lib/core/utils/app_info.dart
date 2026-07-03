// import 'package:package_info_plus/package_info_plus.dart';
//
// class AppInfo {
//   AppInfo._();
//
//   static final AppInfo instance = AppInfo._();
//
//   late final String name;
//   late final String version;
//   late final String buildNumber;
//
//   bool _initialized = false;
//
//   Future<void> init() async {
//     if (_initialized) return;
//     final PackageInfo info = await PackageInfo.fromPlatform();
//     name = info.appName;
//     version = info.version;
//     buildNumber = info.buildNumber;
//
//     _initialized = true;
//   }
// }
