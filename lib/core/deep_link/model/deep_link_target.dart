import 'package:equatable/equatable.dart';

/// A validated deep link target, decoupled from any navigation framework.
class DeepLinkTarget extends Equatable {
  final List<String> pathSegments;
  final Map<String, String> queryParameters;

  const DeepLinkTarget({
    required this.pathSegments,
    required this.queryParameters,
  });

  String get path => '/${pathSegments.join('/')}';

  /// GoRouter-consumable location, e.g. `/classes/42?tab=stats`
  String get location {
    if (queryParameters.isEmpty) return path;
    return '$path?${Uri(queryParameters: queryParameters).query}';
  }

  @override
  List<Object?> get props => [pathSegments, queryParameters];
}
