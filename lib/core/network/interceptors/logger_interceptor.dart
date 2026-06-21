import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sport_flutter_app/core/config/flavor_config.dart';

class LoggerInterceptor implements Interceptor {
  final PrettyDioLogger _dioLogger = PrettyDioLogger(
    enabled: !isProduction,
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    maxWidth: 90,
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _dioLogger.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _dioLogger.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _dioLogger.onResponse(response, handler);
  }
}
