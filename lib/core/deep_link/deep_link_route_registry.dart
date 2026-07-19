/// Single source of truth for top-level routes reachable via deep link.
/// Keep in sync with the GoRouter tree.
class DeepLinkRouteRegistry {
  final Set<String> allowedRoots;

  const DeepLinkRouteRegistry(this.allowedRoots);

  bool isAllowed(String root) => allowedRoots.contains(root);
}
