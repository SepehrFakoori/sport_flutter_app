import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/app_navigation_bar.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/app_navigation_destination.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (page) => navigationShell.goBranch(page),
        destinations: [
          // AppNavigationDestination(
          //   icon: icon,
          //   selectedIcon: selectedIcon,
          //   label: label,
          // ),
          // AppNavigationDestination(
          //   icon: icon,
          //   selectedIcon: selectedIcon,
          //   label: label,
          // ),
          // AppNavigationDestination(
          //   icon: icon,
          //   selectedIcon: selectedIcon,
          //   label: label,
          // ),
        ],
      ),
    );
  }
}
