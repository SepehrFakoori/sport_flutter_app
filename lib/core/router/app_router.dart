import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: appFlavor != 'production',
  initialLocation: AppRoutes.home.path,
  routes: [
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) => Container(color: Colors.red),
    ),
  ],
);
