import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/chips/app_chip.dart';

import '../../../../core/constant/constants.dart';

class CoachLabel extends StatelessWidget {
  const CoachLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      labelText: context.l10n.global_coach_label,
      textStyle: context.textTheme.labelLarge?.copyWith(
        color: context.colors.primary,
      ),
      backgroundColor: context.colors.surface,
      side: BorderSide.none,
      labelPadding: const .symmetric(horizontal: AppSpacing.xs, vertical: -6),
    );
  }
}

class SupportLabel extends StatelessWidget {
  const SupportLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      labelText: context.l10n.global_support_label,
      textStyle: context.textTheme.labelLarge?.copyWith(
        color: AppPalette.semantic2,
      ),
      backgroundColor: AppPalette.semantic2.withValues(alpha: 0.1),
      side: BorderSide.none,
      labelPadding: const .symmetric(horizontal: AppSpacing.xs, vertical: -6),
    );
  }
}
