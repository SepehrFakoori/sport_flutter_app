import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circular_progress_indicator.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isLoading;

  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? AppCircularProgressIndicator()
          : Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.primary,
              ),
            ),
    );
  }
}
