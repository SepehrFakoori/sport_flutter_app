import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_text.dart';

class ChatTileSkeleton extends StatelessWidget {
  const ChatTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: SkeletonBox(
        width: 56,
        height: 56,
        shape: .circle,
      ),
      title: SkeletonText(height: 16, width: 50),
      horizontalTitleGap: 12,
      subtitle: SkeletonText(height: 12, width: 146),
    );
  }
}
