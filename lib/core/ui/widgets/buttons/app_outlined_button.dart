import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isLoading;
  final ButtonVariant type;

  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  }) : type = .primary;

  const AppOutlinedButton.secondary({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  }) : type = .secondary;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: type == .secondary && onPressed != null
          ? OutlinedButton.styleFrom(
              side: BorderSide(color: context.colors.secondary),
              foregroundColor: context.colors.secondary,
            )
          : null,
      child: isLoading ? AppLoadingIndicator() : Text(title),
    );
  }
}
