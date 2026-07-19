class DeepLinkUriParser {
  DeepLinkUriParser._();

  static String? toRoutePath(Uri uri) {
    final List<String> segments = uri.pathSegments;
    if (segments.isEmpty) return null;
    return '';
  }
}
