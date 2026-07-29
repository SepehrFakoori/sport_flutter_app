import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class ClassCardSkeleton extends StatelessWidget {
  const ClassCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SkeletonBox(
            width: 180,
            height: 180,
            shape: .rectangle,
            radius: .circular(AppRadius.xxl),
          ),
          Padding(
            padding: const .all(8.0),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 2,
              children: [
                SkeletonText(height: 14, width: 90),
                SkeletonText(height: 14, width: 120),
                SkeletonText(height: 14, width: 100),
                SkeletonText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
