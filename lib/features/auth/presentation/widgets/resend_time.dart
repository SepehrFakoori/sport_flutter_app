import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/app_spacing.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class ResendTime extends StatelessWidget {
  final String duration;

  const ResendTime({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(AppSpacing.md),
      child: Row(
        mainAxisAlignment: .center,
        mainAxisSize: .max,
        spacing: AppSpacing.xs,
        children: [
          Text(
            context.l10n.auth_resend_code_in,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.onBackgroundSecondary,
            ),
          ),
          Text(
            duration,
            style: context.textTheme.titleMedium?.copyWith(fontWeight: .w600),
          ),
        ],
      ),
    );
  }
}
