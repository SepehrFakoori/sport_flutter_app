import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class InfoItem extends StatelessWidget {
  final String value;
  final String label;

  const InfoItem({super.key, this.value = '0', required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 2,
      children: [
        Text(
          value,
          style: context.textTheme.headlineLarge?.copyWith(fontWeight: .w800),
        ),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(fontWeight: .w600),
        ),
      ],
    );
  }
}