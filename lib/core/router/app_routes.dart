class AppRoute {
  final String path;
  final String? name;

  const AppRoute({required this.path, this.name});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const page1 = AppRoute(name: 'page-1', path: '/1');
  static const page2 = AppRoute(name: 'page-2', path: '/2');
}
