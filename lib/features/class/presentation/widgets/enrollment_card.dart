import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';

class EnrollmentCard extends StatelessWidget {
  const EnrollmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.onSecondary,
        boxShadow: [
          BoxShadow(
            color: context.colors.secondary.withValues(alpha: 0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.class_price_title,
                  style: context.textTheme.titleMedium,
                ),
                Text('450,000 تومان', style: context.textTheme.headlineSmall),
              ],
            ),
          ),
          AppFilledButton(onPressed: () {}, title: 'ثبت نام'),
        ],
      ),
    );
  }
}
