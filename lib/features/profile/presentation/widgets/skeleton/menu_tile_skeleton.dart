import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';

class MenuTileSkeleton extends StatelessWidget {
  const MenuTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: .symmetric(horizontal: 24),
      child: Row(
        spacing: 16,
        children: [
          SkeletonBox(width: 24, height: 24, shape: .circle),
          SkeletonText(width: 150),
        ],
      ),
    );
  }
}
