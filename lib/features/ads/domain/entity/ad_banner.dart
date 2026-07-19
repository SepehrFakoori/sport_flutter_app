/// Where a banner is allowed to be shown.
/// Add new placements here as you reuse banners in more screens.
enum BannerPlacement { home, profile, matchDetail }

/// What happens when the user taps the banner
enum BannerActionType { url, deeplink, none }

class AdBanner {
  final int id;
  final String imageUrl;
  final int order;
  final BannerPlacement placement;
  final BannerActionType actionType;

  /// URL string or deep-link route, depending on [actionType]
  /// Null/empty when [actionType] is [.none]
  final String? actionValue;

  const AdBanner({
    required this.id,
    required this.imageUrl,
    required this.order,
    required this.placement,
    required this.actionType,
    this.actionValue,
  });
}
