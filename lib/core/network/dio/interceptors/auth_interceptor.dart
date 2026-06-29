import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/config/app_config.dart';
import 'package:sport_flutter_app/core/storage/token_storage.dart';

class AuthInterceptor implements QueuedInterceptor {
  final TokenStorage _storage;
  final AppConfig appConfig;

  const AuthInterceptor({
    required TokenStorage storage,
    required this.appConfig,
  }) : _storage = storage;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) return handler.next(err);

    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) {
        await _storage.clear();
        return handler.next(err);
      }

      final response = await Dio(
        BaseOptions(
          baseUrl: appConfig.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ).post('/auth/refresh/', data: {'refresh_token': refreshToken});

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await _storage.saveAccessToken(newAccessToken);
      await _storage.saveRefreshToken(newRefreshToken);

      final retryResponse = await Dio().fetch(
        err.requestOptions.copyWith(
          headers: {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer $newAccessToken',
          },
        ),
      );

      handler.resolve(retryResponse);
    } catch (_) {
      await _storage.clear();
      handler.next(err);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken = await _storage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }
}
