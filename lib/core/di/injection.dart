import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_flutter_app/core/di/network_module.dart';
import 'package:sport_flutter_app/core/di/service_module.dart';
import 'package:sport_flutter_app/core/storage/token_storage.dart';
import 'package:sport_flutter_app/core/storage/token_storage_impl.dart';
import 'package:sport_flutter_app/features/auth/di/auth_module.dart';
import 'package:sport_flutter_app/features/class/di/class_module.dart';
import 'package:sport_flutter_app/features/profile/di/profile_module.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<TokenStorage>(
    () => TokenStorageImpl(const FlutterSecureStorage()),
  );
  registerNetworkModule();
  registerServiceModule();
  registerAuthModule();
  registerProfileModule();
  registerClassModule();
}
