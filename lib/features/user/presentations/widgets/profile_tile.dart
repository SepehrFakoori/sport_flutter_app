import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class ProfileTile extends StatelessWidget {
  final String username;
  final String phoneNumber;
  final String? imageUrl;
  final GestureTapCallback? onTap;

  const ProfileTile({
    super.key,
    required this.username,
    required this.phoneNumber,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      horizontalTitleGap: 12,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Hero(
        tag: 'profile',
        child: AppCircleAvatar(
          username: username,
          imageUrl: imageUrl,
          radius: 28,
        ),
      ),
      title: Text(username),
      titleTextStyle: context.textTheme.headlineSmall?.copyWith(
        fontWeight: .w600,
      ),
      subtitle: Text(phoneNumber),
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: .w500,
        color: context.colors.textSecondary,
      ),
    );
  }
}
