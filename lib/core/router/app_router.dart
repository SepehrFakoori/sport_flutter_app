import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/features/home/presentations/home_page.dart';

import 'app_routes.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: appFlavor != 'production',
  initialLocation: AppRoutes.home.path,
  routes: <RouteBase>[
    GoRoute(path: AppRoutes.home.path, builder: (context, state) => HomePage()),
  ],
);
