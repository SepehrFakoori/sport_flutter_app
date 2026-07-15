import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/rating_indicator.dart';

class RatingSummary extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const RatingSummary({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        RatingIndicator(rating: rating),
        Text(
          '($reviewCount)',
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.onBackgroundSecondary,
          ),
        ),
      ],
    );
  }
}
