class AppRoute {
  final String path;
  final String? name;

  const AppRoute({required this.path, this.name});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
}
