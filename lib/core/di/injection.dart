import 'package:get_it/get_it.dart';
import 'package:sport_flutter_app/core/config/app_config.dart';
import 'package:sport_flutter_app/core/di/network_module.dart';
import 'package:sport_flutter_app/features/auth/di/auth_module.dart';

final sl = GetIt.instance;

Future<void> setupDependencies(AppConfig config) async {
  registerNetworkModule(config);
  registerAuthModule();
}
