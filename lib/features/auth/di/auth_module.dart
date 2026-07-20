import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/storage/device_id/device_id_storage.dart';
import 'package:sport_flutter_app/core/storage/token/token_storage.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource_impl.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource_impl.dart';
import 'package:sport_flutter_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/logout_usecase.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/resend_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/send_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/verify_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';

void registerAuthModule() {
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(sl<TokenStorage>(), sl<DeviceIdStorage>()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl(), sl(), sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteDatasource>(),
      sl<AuthLocalDatasource>(),
    ),
  );

  sl.registerLazySingleton(() => SendOtpUseCase(sl()));
  sl.registerLazySingleton(() => ResendOtpUseCase(sl()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  sl.registerFactory(() => EnterPhoneBloc(sl()));
  sl.registerFactory(() => VerifyOtpBloc(verifyOtp: sl(), resendOtp: sl()));
  sl.registerFactory(() => LogoutBloc(sl()));
}
