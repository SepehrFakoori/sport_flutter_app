import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/network/interceptors/logger_interceptor.dart';

class HTTPClient {
  final Dio dio;

  HTTPClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://google.com",
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      ) {
    dio.interceptors.addAll([LoggerInterceptor()]);
  }
}
