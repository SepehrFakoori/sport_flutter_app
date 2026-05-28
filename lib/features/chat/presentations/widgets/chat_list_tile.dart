import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class ChatListTile extends StatelessWidget {
  final String username;
  final String subtitle;

  const ChatListTile({
    super.key,
    required this.username,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      horizontalTitleGap: 12,
      titleAlignment: ListTileTitleAlignment.center,
      leading: AppCircleAvatar(username: username, radius: 28),
      title: Text(username),
      titleTextStyle: context.textTheme.headlineSmall?.copyWith(
        fontWeight: .w600,
      ),
      subtitle: Text(subtitle),
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: .w500,
        color: context.colors.textSecondary,
      ),
    );
  }
}
