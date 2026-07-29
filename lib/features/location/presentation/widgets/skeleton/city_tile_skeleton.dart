import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class CityTileSkeleton extends StatelessWidget {
  const CityTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: AppSpacing.lg),
      child: Padding(
        padding: const .symmetric(vertical: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 8,
          children: [SkeletonText(width: 150), SkeletonText(width: 120)],
        ),
      ),
    );
  }
}
