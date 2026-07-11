import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class SummaryStat extends StatelessWidget {
  final num value;
  final String label;

  const SummaryStat({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Text(
          '$value',
          style: context.textTheme.headlineMedium?.copyWith(fontWeight: .w700),
        ),
        Text(label, style: context.textTheme.titleMedium),
      ],
    );
  }
}
