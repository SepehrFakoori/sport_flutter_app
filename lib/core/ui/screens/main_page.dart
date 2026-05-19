import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/app_navigation_bar.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/app_navigation_destination.dart';

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
            icon: 'assets/icons/home.svg',
            selectedIcon: 'assets/icons/home-filled.svg',
            label: 'context.l10n.ads',
          ),
          AppNavigationDestination(
            icon: 'assets/icons/home.svg',
            selectedIcon: 'assets/icons/home-filled.svg',
            label: 'context.l10n.ads1',
          ),
          AppNavigationDestination(
            icon: 'assets/icons/home.svg',
            selectedIcon: 'assets/icons/home-filled.svg',
            label: 'context.l10n.ads2',
          ),
        ],
      ),
    );
  }
}
