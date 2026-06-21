import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/config/app_config.dart';
import 'package:sport_flutter_app/core/network/interceptors/logger_interceptor.dart';

class DioFactory {
  final AppConfig config;

  const DioFactory(this.config);

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.addAll([LoggerInterceptor()]);

    return dio;
  }
}
