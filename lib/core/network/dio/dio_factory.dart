import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/config/app_base_url.dart';

class DioFactory {
  final List<Interceptor> interceptors;

  const DioFactory({required this.interceptors});

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppBaseUrl.baseUrl,
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
