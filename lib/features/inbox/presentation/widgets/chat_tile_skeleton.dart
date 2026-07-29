import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';

import '../../../../core/constant/constants.dart';

class ChatTileSkeleton extends StatelessWidget {
  const ChatTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const .symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xs,
      ),
      leading: SkeletonBox(width: 56, height: 56, shape: .circle),
      title: const Align(
        alignment: .centerStart,
        child: SkeletonText(height: 16, width: 112),
      ),
      horizontalTitleGap: 12,
      subtitle: SkeletonText(height: 12),
    );
  }
}
