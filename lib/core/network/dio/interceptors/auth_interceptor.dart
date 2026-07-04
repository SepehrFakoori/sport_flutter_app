import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/config/app_base_url.dart';
import 'package:sport_flutter_app/core/storage/token_storage.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage _storage;

  AuthInterceptor({required TokenStorage storage}) : _storage = storage;

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
          baseUrl: AppBaseUrl.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ).post('/refresh', data: {'refresh': refreshToken});

      final newAccessToken = response.data['access'];
      final newRefreshToken = response.data['refresh'];

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
