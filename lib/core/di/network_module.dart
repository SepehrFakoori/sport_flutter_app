import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/dio/dio_factory.dart';
import 'package:sport_flutter_app/core/network/dio/dio_http_client.dart';
import 'package:sport_flutter_app/core/network/dio/interceptors/auth_interceptor.dart';
import 'package:sport_flutter_app/core/network/dio/interceptors/logger_interceptor.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';

void registerNetworkModule() {
  sl.registerLazySingleton(() => AuthInterceptor(storage: sl()));
  sl.registerLazySingleton(() => LoggerInterceptor());
  sl.registerLazySingleton(
    () => DioFactory(
      interceptors: [sl<LoggerInterceptor>(), sl<AuthInterceptor>()],
    ).create(),
  );
  sl.registerLazySingleton<HttpClient>(() => DioHttpClient(sl()));
}
