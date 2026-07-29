import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_pressable_scale.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final ButtonVariant type;
  final bool isWide;

  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.isWide = false,
  }) : type = .primary;

  const AppOutlinedButton.secondary({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.isWide = false,
  }) : type = .secondary;

  @override
  Widget build(BuildContext context) {
    final Widget button = AbsorbPointer(
      absorbing: isLoading,
      child: AppPressableScale(
        isActive: onPressed != null,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: type == .secondary && onPressed != null
              ? OutlinedButton.styleFrom(
                  side: BorderSide(color: context.colors.secondary),
                  foregroundColor: context.colors.secondary,
                )
              : null,
          child: isLoading ? AppLoadingIndicator() : Text(title),
        ),
      ),
    );

    if (isWide) {
      return Container(
        width: .infinity,
        margin: const .symmetric(horizontal: AppSpacing.lg),
        child: button,
      );
    }

    return button;
  }
}
