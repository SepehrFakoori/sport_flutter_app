import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';

class ChatTile extends StatelessWidget {
  final String sender;
  final String message;
  final GestureTapCallback? onTap;

  const ChatTile({
    super.key,
    required this.sender,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: AppCircleAvatar(username: sender, radius: 28),
      title: Text(sender, maxLines: 1, overflow: .ellipsis),
      titleTextStyle: context.textTheme.titleLarge?.copyWith(
        color: context.colors.onBackground,
      ),
      horizontalTitleGap: 12,
      subtitle: Row(
        spacing: 12,
        children: [
          Expanded(child: Text(message * 2, maxLines: 1, overflow: .ellipsis)),
          Text('22:00', maxLines: 1, overflow: .ellipsis),
        ],
      ),
      subtitleTextStyle: context.textTheme.titleMedium?.copyWith(
        color: context.colors.onBackgroundSecondary,
        fontWeight: .w400,
      ),
      isThreeLine: false,
    );
  }
}
