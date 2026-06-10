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
        Text(
          '۳۰۰،۰۰۰',
          style: context.textTheme.titleLarge?.copyWith(height: 1),
        ),
        Text(
          'تومان/ماهانه',
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.onBackgroundSecondary,
          ),
        ),
      ],
    );
  }
}
