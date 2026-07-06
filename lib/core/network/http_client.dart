import 'package:sport_flutter_app/core/network/http_response.dart';

abstract class HttpClient {
  Future<HttpResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  });

  Future<HttpResponse> post(String path, {Object? data});

  Future<HttpResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<HttpResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
