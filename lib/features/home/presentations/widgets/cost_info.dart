import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class CostInfo extends StatelessWidget {
  final String cost;

  const CostInfo({super.key, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .end,
      crossAxisAlignment: .center,
      mainAxisSize: .max,
      spacing: 8,
      children: [
        Text(cost, style: context.textTheme.titleLarge),
        Text(
          'تومان/ماهانه',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
