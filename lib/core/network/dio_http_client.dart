import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient(this._dio);

  @override
  Future<HttpResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return HttpResponse(statusCode: res.statusCode!, data: res.data);
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await _dio.get(path, data: data, queryParameters: queryParams);

    return HttpResponse(statusCode: res.statusCode!, data: res.data);
  }

  @override
  Future<HttpResponse> post(String path, {Object? data}) async {
    final res = await _dio.post(path, data: data);

    return HttpResponse(statusCode: res.statusCode!, data: res.data);
  }

  @override
  Future<HttpResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );

    return HttpResponse(statusCode: res.statusCode!, data: res.data);
  }
}
