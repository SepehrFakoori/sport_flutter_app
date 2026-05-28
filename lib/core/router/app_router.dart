import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/screens/main_page.dart';
import 'package:sport_flutter_app/features/chat/presentations/chats_page.dart';
import 'package:sport_flutter_app/features/home/presentations/home_page.dart';
import 'package:sport_flutter_app/features/user/presentations/profile_page.dart';
import 'package:sport_flutter_app/features/user/presentations/account_page.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: appFlavor != 'production',
  initialLocation: AppRoutes.home.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.home.path,
              builder: (context, state) => HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.page1.path,
              builder: (context, state) => Container(color: Colors.red),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.chats.path,
              builder: (context, state) => ChatsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.account.path,
              builder: (context, state) => AccountPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: AppRoutes.profile.name,
      path: AppRoutes.profile.path,
      builder: (context, state) => ProfilePage(),
    ),
  ],
);
