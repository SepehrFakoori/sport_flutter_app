import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/rating_chip.dart';

class CoachInfo extends StatelessWidget {
  final String firstname;
  final String lastname;

  const CoachInfo({super.key, required this.firstname, required this.lastname});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      spacing: 4,
      children: [
        IconWidget(
          icon: AssetIcons.profile,
          color: context.colors.onBackgroundSecondary,
          width: 16,
          height: 16,
        ),
        Flexible(
          child: Text(
            '$firstname $lastname',
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onBackgroundSecondary,
            ),
          ),
        ),
        RatingChip(rate: 4.6),
      ],
    );
  }
}
