import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';

enum ButtonVariant { primary, secondary }

class AppFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final ButtonVariant type;
  final bool isWide;

  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.isWide = false,
  }) : type = .primary;

  const AppFilledButton.secondary({
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
      child: FilledButton(
        onPressed: onPressed,
        style: type == .secondary
            ? FilledButton.styleFrom(backgroundColor: context.colors.secondary)
            : null,
        child: isLoading ? AppLoadingIndicator() : Text(title),
      ),
    );

    if (isWide) {
      return Container(
        width: .infinity,
        margin: .symmetric(horizontal: 24.0),
        child: button,
      );
    }

    return button;
  }
}
