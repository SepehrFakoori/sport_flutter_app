import 'package:sport_flutter_app/core/deep_link/deep_link_route_registry.dart';
import 'package:sport_flutter_app/core/deep_link/model/deep_link_resolution.dart';
import 'package:sport_flutter_app/core/deep_link/model/deep_link_target.dart';

class DeepLinkParser {
  final String expectedHost;
  final String expectedCustomScheme;
  final DeepLinkRouteRegistry routeRegistry;

  const DeepLinkParser({
    required this.expectedHost,
    required this.expectedCustomScheme,
    required this.routeRegistry,
  });

  DeepLinkResolution resolve(Uri uri) {
    final List<String> segments;

    if (uri.scheme == 'https') {
      if (uri.host != expectedHost) {
        return const DeepLinkRejected(.untrustedHost);
      }
      segments = uri.pathSegments;
    } else if (uri.scheme == expectedCustomScheme) {
      segments = [if (uri.host.isNotEmpty) uri.host, ...uri.pathSegments];
    } else {
      return const DeepLinkRejected(.untrustedScheme);
    }

    if (segments.isEmpty) {
      return const DeepLinkRejected(.emptyPath);
    }
    if (!routeRegistry.isAllowed(segments.first)) {
      return const DeepLinkRejected(.notAllowlisted);
    }

    return DeepLinkResolved(
      DeepLinkTarget(
        pathSegments: segments,
        queryParameters: uri.queryParameters,
      ),
    );
  }
}
