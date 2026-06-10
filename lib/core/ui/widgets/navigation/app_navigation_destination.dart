import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class AppNavigationDestination extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final String label;
  final String? tooltip;

  const AppNavigationDestination({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: IconWidget(icon: icon, color: context.colors.onBackgroundSecondary),
      selectedIcon: IconWidget(
        icon: selectedIcon,
        color: context.colors.primary,
      ),
      label: label,
      tooltip: tooltip,
    );
  }
}
