class AppRoute {
  final String path;
  final String? name;

  const AppRoute({required this.path, this.name});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const dashboard = AppRoute(name: 'dashboard', path: '/dashboard');
  static const inbox = AppRoute(name: 'inbox', path: '/inbox');
  static const chat = AppRoute(name: 'chat', path: '/chat');
  static const account = AppRoute(name: 'account', path: '/account');
  static const profile = AppRoute(name: 'profile', path: '/profile');
  static const editProfile = AppRoute(name: 'edit-profile', path: '/edit-profile');
  static const coach = AppRoute(name: 'coach', path: '/coach/:id');
  static const classInfo = AppRoute(name: 'class', path: '/class/:id');
  static const auth = AppRoute(name: 'auth', path: '/auth');
  static const enterPhone = AppRoute(
    name: 'auth.enter-phone',
    path: 'enter-phone',
  );
  static const verifyOtp = AppRoute(
    name: 'auth.verify-otp',
    path: 'verify-otp',
  );
}
