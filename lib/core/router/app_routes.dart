class AppRoute {
  final String path;
  final String? name;

  const AppRoute({required this.path, this.name});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const page1 = AppRoute(name: 'page-1', path: '/1');
  static const inbox = AppRoute(name: 'inbox', path: '/inbox');
  static const chat = AppRoute(name: 'chat', path: '/chat');
  static const account = AppRoute(name: 'account', path: '/account');
  static const profile = AppRoute(name: 'profile', path: '/profile');
  static const coach = AppRoute(name: 'coach', path: '/coach/:id');
  static const classInfo = AppRoute(name: 'class', path: '/class/:id');
}
