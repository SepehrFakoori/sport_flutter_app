import 'package:sport_flutter_app/core/config/app_config.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/dio_factory.dart';
import 'package:sport_flutter_app/core/network/dio_http_client.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';

void registerNetworkModule(AppConfig config) {
  sl.registerLazySingleton(() => config);
  sl.registerLazySingleton(() => DioFactory(sl()).create());
  sl.registerLazySingleton<HttpClient>(() => DioHttpClient(sl()));
}
