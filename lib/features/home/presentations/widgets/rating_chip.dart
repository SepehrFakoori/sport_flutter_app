import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class RatingChip extends StatelessWidget {
  final double rate;
  final double? height;
  final double? width;

  const RatingChip({
    super.key,
    required this.rate,
    this.height = 12,
    this.width = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        Text(
          rate.toString(),
          textScaler: .noScaling,
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 12,
            color: context.colors.onBackgroundSecondary,
            height: 0.1,
          ),
        ),
        IconWidget(
          icon: AssetIcons.starFilled,
          height: height,
          width: width,
          color: context.colors.onBackgroundSecondary,
        ),
      ],
    );
  }
}
