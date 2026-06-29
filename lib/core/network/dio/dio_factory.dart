import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/config/app_config.dart';

class DioFactory {
  final AppConfig config;
  final List<Interceptor> interceptors;

  const DioFactory(this.config, {required this.interceptors});

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
