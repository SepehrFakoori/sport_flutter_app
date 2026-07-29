import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final double size;

  const RatingStars({super.key, required this.rating, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;

        if (rating >= starValue) {
          return IconWidget(
            icon: AppIcons.starFilled,
            color: AppPalette.semantic3,
            size: size,
          );
        }

        return IconWidget(
          icon: AppIcons.star,
          color: AppPalette.semantic3,
          size: size,
        );
      }),
    );
  }
}
