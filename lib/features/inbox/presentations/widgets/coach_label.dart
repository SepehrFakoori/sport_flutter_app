import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_chip.dart';

class CoachLabel extends StatelessWidget {
  const CoachLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      labelText: context.l10n.global_coach_label,
      textStyle: context.textTheme.labelLarge?.copyWith(
        color: context.colors.primary,
        height: 1,
      ),
      backgroundColor: context.colors.surface,
      side: BorderSide.none,
      labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: -6),
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
        height: 1,
      ),
      backgroundColor: AppPalette.semantic2.withValues(alpha: 0.1),
      side: BorderSide.none,
      labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: -6),
    );
  }
}
