import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class CoachTile extends StatelessWidget {
  final String fullName;
  final String credentials;
  final String? imageUrl;
  final VoidCallback? onTap;

  const CoachTile({
    super.key,
    required this.fullName,
    required this.credentials,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: AppCircleAvatar(fullName: fullName, imageUrl: imageUrl),
      title: Text(fullName),
      titleTextStyle: context.textTheme.titleLarge,
      subtitle: Text(credentials),
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        color: context.colors.onBackgroundSecondary,
      ),
    );
  }
}
