class HttpResponse {
  final int statusCode;
  final dynamic data;

  const HttpResponse({required this.statusCode, required this.data});
}

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

  Future<HttpResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}
