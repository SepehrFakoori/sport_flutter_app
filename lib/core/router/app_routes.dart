class AppRoute {
  final String path;
  final String? name;

  const AppRoute({required this.path, this.name});
}

sealed class AppRoutes {
  static const home = AppRoute(name: 'home', path: '/');
  static const dashboard = AppRoute(name: 'dashboard', path: '/dashboard');
  static const search = AppRoute(name: 'search', path: '/search');
  static const inbox = AppRoute(name: 'inbox', path: '/inbox');
  static const chat = AppRoute(name: 'chat', path: '/chat');
  static const account = AppRoute(name: 'account', path: '/account');
  static const profile = AppRoute(name: 'profile', path: '/profile');
  static const completeProfile = AppRoute(
    name: 'profile.complete',
    path: 'complete',
  );
  static const editProfile = AppRoute(name: 'profile.edit', path: 'edit');
  static const coaches = AppRoute(name: 'coaches', path: '/coaches');
  static const coach = AppRoute(name: 'coach', path: ':id');
  static const coachReviews = AppRoute(name: 'coach.reviews', path: 'reviews');
  static const classes = AppRoute(name: 'classes', path: '/classes');
  static const classDetail = AppRoute(name: 'class', path: ':id');
  static const classReviews = AppRoute(name: 'class.reviews', path: 'reviews');
  static const enroll = AppRoute(name: 'enroll', path: '/enroll');
  static const map = AppRoute(name: 'map', path: '/map');
  static const notifications = AppRoute(
    name: 'notifications',
    path: '/notifications',
  );
  static const notification = AppRoute(name: 'notification', path: ':id');
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
