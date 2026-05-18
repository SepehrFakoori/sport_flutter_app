class AppRoute {
  final String name;
  final String path;

  const AppRoute({required this.name, required this.path});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const classes = AppRoute(name: 'classes', path: '/classes');
  static const coaches = AppRoute(name: 'coaches', path: '/coaches');
  static const user = AppRoute(name: 'user', path: '/user');
}
