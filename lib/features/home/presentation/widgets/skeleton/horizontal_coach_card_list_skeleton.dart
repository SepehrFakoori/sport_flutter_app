import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/coach_overview_skeleton.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class HorizontalCoachCardListSkeleton extends StatelessWidget {
  const HorizontalCoachCardListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: AppSpacing.lg),
      itemBuilder: (context, index) => CoachOverviewSkeleton(),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: 8,
    );
  }
}
