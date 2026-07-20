class DeepLinkBuilder {
  final String host;

  const DeepLinkBuilder({required this.host});

  Uri build(List<String> segments, {Map<String, String>? queryParameters}) {
    return Uri.https(host, '/${segments.join('/')}', queryParameters);
  }
}
