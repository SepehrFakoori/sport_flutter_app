import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

enum AppSnackBarType { neutral, success, error }

class AppSnackBar {
  AppSnackBar._();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context, {
    required String message,
    AppSnackBarType type = AppSnackBarType.neutral,
  }) {
    final accent = switch (type) {
      AppSnackBarType.success => AppPalette.semantic4,
      AppSnackBarType.error => AppPalette.semantic1,
      AppSnackBarType.neutral => AppPalette.semantic2,
    };

    context.messenger.hideCurrentSnackBar();

    return context.messenger.showSnackBar(
      SnackBar(
        behavior: .floating,
        margin: const .symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        backgroundColor: accent,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(AppRadius.sm),
          side: BorderSide(color: accent),
        ),
        dismissDirection: .horizontal,
        elevation: 1,
        content: Text(
          message,
          maxLines: 1,
          overflow: .ellipsis,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> success(
    BuildContext context,
    String message,
  ) => show(context, message: message, type: AppSnackBarType.success);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error(
    BuildContext context,
    String message,
  ) => show(context, message: message, type: AppSnackBarType.error);
}
