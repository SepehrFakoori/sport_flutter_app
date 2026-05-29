import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class RatingChip extends StatelessWidget {
  final double rate;

  const RatingChip({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        Text(
          rate.toString(),
          style: context.textTheme.bodySmall?.copyWith(height: 1),
        ),
        IconWidget(icon: AssetIcons.starFilled, height: 14, width: 14),
      ],
    );
  }
}
