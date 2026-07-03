import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class ClassFeatures extends StatelessWidget {
  final List<String> feature;

  const ClassFeatures({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 4,
        children: [
          Text(
            context.l10n.class_features,
            textAlign: .start,
            style: context.textTheme.headlineSmall,
          ),
          SizedBox(
            height: 66,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: feature.length,
              itemBuilder: (context, index) => Row(
                spacing: 8,
                children: [
                  const Text('•'),
                  Text(
                    feature[index],
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
