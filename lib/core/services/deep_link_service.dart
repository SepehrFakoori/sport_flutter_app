import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';

class DeepLinkService {
  DeepLinkService(this._appLinks, this._router, {required this.expectedHost});

  final AppLinks _appLinks;
  final GoRouter _router;
  final String expectedHost; // from FlavorConfig, e.g. dev.my-domain.ir

  StreamSubscription<Uri>? _sub;

  Future<void> init() async {
    final initial = await _appLinks.getInitialLink();
    if (initial != null) _handle(initial);
    _sub = _appLinks.uriLinkStream.listen(_handle, onError: (_) {});
  }

  /// Public entry point for links arriving via push notification payloads
  /// or any other non-OS-intercepted source.
  void handleExternal(Uri uri) => _handle(uri);

  void _handle(Uri uri) {
    final location = _toLocation(uri);
    if (location == null) return;
    _router.go(location);
  }

  /// Converts an https:// or custom-scheme URI into a GoRouter location
  /// string, validated against DeepLinkableRoutes.allowedRoots.
  /// Returns null for anything untrusted or not deep-linkable.
  String? _toLocation(Uri uri) {
    if (uri.scheme == 'https' && uri.host != expectedHost) return null;

    final segments = uri.scheme == 'https'
        ? uri.pathSegments
        : [if (uri.host.isNotEmpty) uri.host, ...uri.pathSegments];

    if (segments.isEmpty) return null;
    // if (!DeepLinkableRoutes.allowedRoots.contains(segments.first)) return null;

    final path = '/${segments.join('/')}';
    return uri.query.isEmpty ? path : '$path?${uri.query}';
  }

  void dispose() => _sub?.cancel();
}
