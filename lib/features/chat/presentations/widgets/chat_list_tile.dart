import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/features/chat/presentations/widgets/coach_label.dart';

enum ChatType { coach, user, support }

class ChatListTile extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String lastMessage;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final ChatType? type;

  const ChatListTile({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.lastMessage,
    this.onTap,
    this.onLongPress,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongPress,
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      horizontalTitleGap: 12,
      titleAlignment: ListTileTitleAlignment.center,
      isThreeLine: false,
      leading: AppCircleAvatar(username: '$firstname $lastname', radius: 28),
      title: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        spacing: 4,
        children: [
          Flexible(
            child: Text(
              '$firstname $lastname',
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          ?_getChatLabel(type),
        ],
      ),
      titleTextStyle: context.textTheme.headlineSmall?.copyWith(
        fontWeight: .w600,
        height: 1.5,
      ),
      subtitle: Text(lastMessage, maxLines: 1, overflow: .ellipsis),
      subtitleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: .w500,
        color: context.colors.onBackgroundSecondary,
      ),
    );
  }

  Widget? _getChatLabel(ChatType? type) {
    switch (type) {
      case .coach:
        return CoachLabel();
      case .support:
        return SupportLabel();
      default:
        return null;
    }
  }
}
