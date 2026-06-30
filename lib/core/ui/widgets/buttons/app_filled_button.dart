import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';

enum ButtonVariant { primary, secondary }

class AppFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final ButtonVariant type;

  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  }) : type = .primary;

  const AppFilledButton.secondary({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  }) : type = .secondary;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: type == .secondary
          ? FilledButton.styleFrom(backgroundColor: context.colors.secondary)
          : null,
      child: isLoading ? AppLoadingIndicator() : Text(title),
    );
  }
}
