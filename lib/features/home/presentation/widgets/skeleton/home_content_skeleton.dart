import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/horizontal_class_card_list_skeleton.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/horizontal_coach_card_list_skeleton.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class HomeContentSkeleton extends StatelessWidget {
  const HomeContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .all(AppSpacing.lg),
          child: SkeletonText(height: 16, width: 120),
        ),
        SizedBox(height: 270, child: HorizontalCoachCardListSkeleton()),
        Padding(
          padding: const .all(AppSpacing.lg),
          child: SkeletonText(height: 16, width: 120),
        ),
        SizedBox(height: 293, child: HorizontalClassCardListSkeleton()),
      ],
    );
  }
}
