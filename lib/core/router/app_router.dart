import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/config/flavor_config.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/screens/main_page.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/enter_phone_screen.dart';
import 'package:sport_flutter_app/features/auth/presentation/verify_otp_screen.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_bloc.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_bloc.dart';
import 'package:sport_flutter_app/features/class/presentation/class_list_screen.dart';
import 'package:sport_flutter_app/features/class/presentation/class_screen.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_bloc.dart';
import 'package:sport_flutter_app/features/dashboard/presentation/dashboard_screen.dart';
import 'package:sport_flutter_app/features/enrollment/presentation/enroll_screen.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:sport_flutter_app/features/inbox/presentation/chat_screen.dart';
import 'package:sport_flutter_app/features/coach/presentation/coach_screen.dart';
import 'package:sport_flutter_app/features/home/presentation/home_screen.dart';
import 'package:sport_flutter_app/features/inbox/presentation/inbox_screen.dart';
import 'package:sport_flutter_app/features/notification/presentation/notifications_list_screen.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/complete_profile_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/profile_edit_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/profile_screen.dart';
import 'package:sport_flutter_app/features/profile/presentation/account_screen.dart';
import 'package:sport_flutter_app/features/review/presentation/reviews_screen.dart';
import 'package:sport_flutter_app/features/search/presentation/search_screen.dart';

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
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
                ],
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.dashboard.path,
              builder: (context, state) => DashboardScreen(),
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
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileBloc>(
                    create: (context) => sl<ProfileBloc>(),
                  ),
                  BlocProvider<LogoutBloc>(
                    create: (context) => sl<LogoutBloc>(),
                  ),
                ],
                child: AccountScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.profile.path,
      name: AppRoutes.profile.name,
      builder: (context, state) {
        final profile = state.extra as Profile;

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<ProfilePhotoBloc>()),
          ],
          child: ProfileScreen(profile: profile),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.completeProfile.path,
          name: AppRoutes.completeProfile.name,
          builder: (context, state) => BlocProvider<CompleteProfileBloc>(
            create: (context) => sl<CompleteProfileBloc>(),
            child: CompleteProfileScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.editProfile.path,
          name: AppRoutes.editProfile.name,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

            final field = data['field'];
            final name = data['name'];

            return BlocProvider<ProfileEditBloc>(
              create: (context) => sl<ProfileEditBloc>(),
              child: ProfileEditScreen(field: field, name: name),
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.chat.path,
      name: AppRoutes.chat.name,
      builder: (context, state) => ChatScreen(),
    ),
    GoRoute(
      path: AppRoutes.search.path,
      name: AppRoutes.search.name,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.coaches.path,
      name: AppRoutes.coaches.name,
      builder: (context, state) => Placeholder(),
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.coach.path,
          name: AppRoutes.coach.name,
          builder: (context, state) {
            final coachId = int.tryParse(state.pathParameters['id']!);

            return BlocProvider<CoachBloc>(
              create: (context) => sl<CoachBloc>(),
              child: CoachScreen(coachId: coachId!),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.coachReviews.path,
              name: AppRoutes.coachReviews.name,
              builder: (context, state) {
                final coachId = int.tryParse(state.pathParameters['id']!);

                return ReviewsScreen(id: coachId!, type: .coachReviews);
              },
            ),
          ],
        ),
      ],
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
    GoRoute(
      path: AppRoutes.classes.path,
      name: AppRoutes.classes.name,
      builder: (context, state) => BlocProvider<ClassListBloc>(
        create: (context) => sl<ClassListBloc>(),
        child: ClassListScreen(),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.classDetail.path,
          name: AppRoutes.classDetail.name,
          builder: (context, state) {
            final classId = int.tryParse(state.pathParameters['id']!);

            return BlocProvider<ClassBloc>(
              create: (context) => sl<ClassBloc>(),
              child: ClassScreen(classId: classId!),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.classReviews.path,
              name: AppRoutes.classReviews.name,
              builder: (context, state) {
                final classId = int.tryParse(state.pathParameters['id']!);

                return ReviewsScreen(id: classId!, type: .classReviews);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.notifications.path,
      name: AppRoutes.notifications.name,
      builder: (context, state) => NotificationsListScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.notification.path,
          name: AppRoutes.notification.name,
          builder: (context, state) {
            final notifId = int.tryParse(state.pathParameters['id']!);

            return const Placeholder();
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.enroll.path,
      name: AppRoutes.enroll.name,
      builder: (context, state) => EnrollScreen(),
    ),
  ],
);
