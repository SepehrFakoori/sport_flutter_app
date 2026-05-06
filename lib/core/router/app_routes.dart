class AppRoute {
  final String name;
  final String path;

  const AppRoute({required this.name, required this.path});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
}
