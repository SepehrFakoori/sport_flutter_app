import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class RatingValue extends StatelessWidget {
  final double rating;

  const RatingValue({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        IconWidget(
          icon: AppIcons.starFilled,
          size: 12,
          color: context.colors.secondary,
        ),
        Text(
          '$rating',
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colors.secondary,
          ),
        ),
      ],
    );
  }
}
