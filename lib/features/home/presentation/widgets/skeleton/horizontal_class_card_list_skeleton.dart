import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/class_card_skeleton.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class HorizontalClassCardListSkeleton extends StatelessWidget {
  const HorizontalClassCardListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: AppSpacing.lg),
      itemBuilder: (context, index) => ClassCardSkeleton(),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: 8,
    );
  }
}
