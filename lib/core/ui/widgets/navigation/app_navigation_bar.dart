import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/navigation/app_navigation_destination.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppNavigationDestination> destinations;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      elevation: 0.5,
      labelPadding: EdgeInsetsGeometry.all(4),
      destinations: destinations,
    );
  }
}
