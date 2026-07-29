import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_flutter_app/core/di/network_module.dart';
import 'package:sport_flutter_app/core/di/service_module.dart';
import 'package:sport_flutter_app/core/storage/device_id/device_id_storage.dart';
import 'package:sport_flutter_app/core/storage/device_id/device_id_storage_impl.dart';
import 'package:sport_flutter_app/core/storage/token/token_storage.dart';
import 'package:sport_flutter_app/core/storage/token/token_storage_impl.dart';
import 'package:sport_flutter_app/features/auth/di/auth_module.dart';
import 'package:sport_flutter_app/features/class/di/class_module.dart';
import 'package:sport_flutter_app/features/coach/di/coach_module.dart';
import 'package:sport_flutter_app/features/enrollment/di/enrollment_module.dart';
import 'package:sport_flutter_app/features/location/di/location_module.dart';
import 'package:sport_flutter_app/features/profile/di/profile_module.dart';
import 'package:uuid/uuid.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<TokenStorage>(
    () => TokenStorageImpl(const FlutterSecureStorage()),
  );
  sl.registerLazySingleton<DeviceIdStorage>(
    () => DeviceIdStorageImpl(const FlutterSecureStorage(), uuid: Uuid()),
  );
  registerNetworkModule();
  registerServiceModule();
  registerAuthModule();
  registerProfileModule();
  registerClassModule();
  registerCoachModule();
  registerEnrollmentModule();
  registerLocationModule();
}
