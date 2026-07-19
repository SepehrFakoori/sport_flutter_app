import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/deep_link/model/deep_link_resolution.dart';
import 'package:sport_flutter_app/core/deep_link/parser/deep_link_parser.dart';

class DeepLinkService {
  final AppLinks _appLinks;
  final GoRouter _router;
  final DeepLinkParser _parser;
  final void Function(DeepLinkRejectionReason, Uri) _onRejected;

  DeepLinkService({
    required AppLinks appLinks,
    required GoRouter router,
    required DeepLinkParser parser,
    required void Function(DeepLinkRejectionReason reason, Uri uri) onRejected,
  }) : _appLinks = appLinks,
       _router = router,
       _parser = parser,
       _onRejected = onRejected;

  StreamSubscription<Uri>? _sub;

  Future<void> init() async {
    _sub = _appLinks.uriLinkStream.listen(_handle, onError: _logStreamError);

    try {
      final initial = await _appLinks.getInitialLink();
      if (initial != null) _handle(initial);
    } catch (e, st) {
      _logStreamError(e, st);
    }
  }

  void handleExternal(Uri uri) => _handle(uri);

  void _handle(Uri uri) {
    switch (_parser.resolve(uri)) {
      case DeepLinkResolved(:final target):
        _router.go(target.location);
      case DeepLinkRejected(:final reason):
        _onRejected(reason, uri);
    }
  }

  void _logStreamError(Object error, [StackTrace? st]) {}

  void dispose() => _sub?.cancel();
}
