import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/navigation/app_navigation_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/navigation/app_navigation_destination.dart';

class MainPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        destinations: <AppNavigationDestination>[
          AppNavigationDestination(
            icon: AppIcons.home,
            selectedIcon: AppIcons.homeFilled,
            label: context.l10n.bottom_navigation_home,
          ),
          AppNavigationDestination(
            icon: AppIcons.dashboard,
            selectedIcon: AppIcons.dashboardFilled,
            label: context.l10n.bottom_navigation_dashboard,
          ),
          AppNavigationDestination(
            icon: AppIcons.message,
            selectedIcon: AppIcons.messageFilled,
            label: context.l10n.bottom_navigation_inbox,
          ),
          AppNavigationDestination(
            icon: AppIcons.profile,
            selectedIcon: AppIcons.profileFilled,
            label: context.l10n.bottom_navigation_profile,
          ),
        ],
      ),
    );
  }
}
