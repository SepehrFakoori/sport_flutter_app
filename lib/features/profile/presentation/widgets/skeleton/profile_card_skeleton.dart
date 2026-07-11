import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';

class ProfileCardSkeleton extends StatelessWidget {
  const ProfileCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0),
      child: CustomCard(
        child: Padding(
          padding: const .all(28),
          child: Column(
            spacing: 4,
            children: [
              SkeletonBox(width: 112, height: 112, shape: .circle),
              const SizedBox(height: 4),
              SkeletonText(width: 112, height: 24),
              SkeletonText(width: 68, height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
