import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class CoachTile extends StatelessWidget {
  final String coachName;
  final String imageUrl;
  final String subtilte;

  const CoachTile({
    super.key,
    required this.coachName,
    required this.imageUrl,
    required this.subtilte,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: AppCircleAvatar(username: coachName, imageUrl: imageUrl),
      title: Text(coachName),
      titleTextStyle: context.textTheme.titleMedium,
      subtitle: Text(subtilte),
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        color: context.colors.onBackgroundSecondary,
      ),
    );
  }
}
