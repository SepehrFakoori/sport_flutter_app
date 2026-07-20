import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';

class CoachSearchTileSkeleton extends StatelessWidget {
  const CoachSearchTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: .center,
        mainAxisSize: .max,
        spacing: 12,
        children: [
          SkeletonBox(width: 80, height: 80, shape: .circle),
          Flexible(
            child: const Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                SkeletonText(height: 14, width: 100),
                SkeletonText(height: 12, width: 120),
                SkeletonText(height: 12, width: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
