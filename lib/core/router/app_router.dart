import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/features/classes/presentations/class_page.dart';
import 'package:sport_flutter_app/features/home/presentations/home_page.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: appFlavor != 'production',
  initialLocation: AppRoutes.classes.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomePage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.classes.path,
              name: AppRoutes.classes.name,
              builder: (context, state) => Container(color: Colors.red),
            ),
            GoRoute(
              path: AppRoutes.coaches.path,
              name: AppRoutes.coaches.name,
              builder: (context, state) => Container(color: Colors.green),
            ),
            GoRoute(
              path: AppRoutes.user.path,
              name: AppRoutes.user.name,
              builder: (context, state) => Container(color: Colors.blue),
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: AppRoutes.home.path,
    //   name: AppRoutes.home.name,
    //   builder: (context, state) => Container(color: Colors.red),
    // ),
    // GoRoute(
    //   path: AppRoutes.classes.path,
    //   name: AppRoutes.classes.name,
    //   builder: (context, state) => ClassPage(),
    // ),
  ],
);
