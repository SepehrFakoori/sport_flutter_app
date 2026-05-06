import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final bool? isSelected;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: IconWidget(icon: icon),
      isSelected: isSelected,
      selectedIcon: IconWidget(icon: icon, color: context.colors.primary),
    );
  }
}
