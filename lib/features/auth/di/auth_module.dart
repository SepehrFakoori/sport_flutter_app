import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/storage/token_storage.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/send_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/verify_otp_usecase.dart';

void registerAuthModule() {
  sl.registerLazySingleton<TokenStorage>(
    () => TokenStorageImpl(const FlutterSecureStorage()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton(() => SendOtpUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
}
