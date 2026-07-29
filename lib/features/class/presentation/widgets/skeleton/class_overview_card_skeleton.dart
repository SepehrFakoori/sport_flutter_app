import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class ClassOverviewCardSkeleton extends StatelessWidget {
  const ClassOverviewCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: AppSpacing.lg),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        spacing: 4,
        children: [
          AspectRatio(
            aspectRatio: AppAspectRatio.ratio4x3,
            child: SkeletonBox(
              width: double.infinity,
              height: double.infinity,
              shape: .rectangle,
              radius: .circular(AppRadius.xxl),
            ),
          ),
          Padding(
            padding: const .all(8.0),
            child: const Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                SkeletonText(height: 16, width: 160),
                SkeletonText(height: 14, width: 100),
                SkeletonText(height: 14, width: 128),
                SkeletonText(height: 14, width: 120),
                SkeletonText(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
