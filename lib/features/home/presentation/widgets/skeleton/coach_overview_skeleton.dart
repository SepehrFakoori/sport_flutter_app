import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';

class CoachOverviewSkeleton extends StatelessWidget {
  const CoachOverviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonBox(
      height: 260,
      width: 180,
      shape: .rectangle,
      radius: .circular(24),
    );
  }
}
