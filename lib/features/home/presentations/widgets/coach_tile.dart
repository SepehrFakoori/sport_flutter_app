import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class CoachTile extends StatelessWidget {
  final String username;
  final String? imageUrl;
  final double? radius;

  const CoachTile({
    super.key,
    required this.username,
    this.imageUrl,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        AppCircleAvatar(username: username, imageUrl: imageUrl, radius: radius),
        Text(
          username,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
