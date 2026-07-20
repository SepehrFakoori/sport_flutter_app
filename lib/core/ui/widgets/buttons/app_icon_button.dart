import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final bool? isSelected;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isSelected,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(10),
      icon: IconWidget(icon: icon, size: 24),
      isSelected: isSelected,
      selectedIcon: IconWidget(icon: icon, color: context.colors.primary),
      tooltip: tooltip,
    );
  }
}
