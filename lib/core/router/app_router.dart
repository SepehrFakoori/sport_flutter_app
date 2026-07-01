import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/config/flavor_config.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/screens/main_page.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/enter_phone_screen.dart';
import 'package:sport_flutter_app/features/auth/presentation/verify_otp_screen.dart';
import 'package:sport_flutter_app/features/class/presentation/class_screen.dart';
import 'package:sport_flutter_app/features/inbox/presentation/chat_screen.dart';
import 'package:sport_flutter_app/features/coach/presentation/coach_screen.dart';
import 'package:sport_flutter_app/features/home/presentation/home_screen.dart';
import 'package:sport_flutter_app/features/inbox/presentation/inbox_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/profile_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/account_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/simple_screen.dart';

final GoRouter routerConfig = GoRouter(
  debugLogDiagnostics: !isProduction,
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
              name: AppRoutes.home.name,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.dashboard.path,
              builder: (context, state) => SimpleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.inbox.path,
              builder: (context, state) => InboxScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.account.path,
              builder: (context, state) => AccountScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.profile.path,
      name: AppRoutes.profile.name,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.chat.path,
      name: AppRoutes.chat.name,
      builder: (context, state) => ChatScreen(),
    ),
    GoRoute(
      path: AppRoutes.coach.path,
      name: AppRoutes.coach.name,
      builder: (context, state) {
        final coachId = int.tryParse(state.pathParameters['id']!);

        return CoachScreen(coachId: coachId!);
      },
    ),
    GoRoute(
      path: AppRoutes.classInfo.path,
      name: AppRoutes.classInfo.name,
      builder: (context, state) {
        final classId = int.tryParse(state.pathParameters['id']!);

        return ClassPage(classId: classId!);
      },
    ),
    GoRoute(
      path: AppRoutes.auth.path,
      name: AppRoutes.auth.name,
      redirect: (context, state) {
        if (state.uri.path == '/auth') {
          return '${AppRoutes.auth.path}/${AppRoutes.enterPhone.path}';
        }
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.enterPhone.path,
          name: AppRoutes.enterPhone.name,
          builder: (context, state) => BlocProvider<EnterPhoneBloc>(
            create: (context) => sl<EnterPhoneBloc>(),
            child: EnterPhoneScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.verifyOtp.path,
          name: AppRoutes.verifyOtp.name,
          builder: (context, state) {
            final String phone = state.extra as String;

            return BlocProvider(
              create: (context) => sl<VerifyOtpBloc>(),
              child: VerifyOtpScreen(phone: phone),
            );
          },
        ),
      ],
    ),
  ],
);
