import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
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
            icon: AssetIcons.home,
            selectedIcon: AssetIcons.homeFilled,
            label: 'context.l10n.ads',
          ),
          AppNavigationDestination(
            icon: AssetIcons.home,
            selectedIcon: AssetIcons.homeFilled,
            label: 'context.l10n.ads1',
          ),
          AppNavigationDestination(
            icon: AssetIcons.home,
            selectedIcon: AssetIcons.homeFilled,
            label: 'context.l10n.ads2',
          ),
        ],
      ),
    );
  }
}
