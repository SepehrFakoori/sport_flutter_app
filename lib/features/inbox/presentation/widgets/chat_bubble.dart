import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class ChatBubble extends StatelessWidget {
  final int index;

  const ChatBubble({super.key, required this.messages, required this.index});

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: index % 2 == 0 ? .end : .start,
      children: [
        Flexible(
          child: Container(
            padding: .all(8),
            constraints: BoxConstraints(maxWidth: context.deviceWidth * 0.8),
            decoration: BoxDecoration(
              // borderRadius: .circular(AppRadius.sm).copyWith(
              //   bottomRight: index % 2 == 0
              //       ? Radius.circular(AppRadius.sm)
              //       : Radius.zero,
              //   bottomLeft: index % 2 == 0
              //       ? Radius.zero
              //       : Radius.circular(AppRadius.sm),
              // ),
              color: index % 2 == 0
                  ? context.colors.divider
                  : context.colors.surface,
            ),
            child: Text(
              messages.reversed.toList()[index],
              overflow: .visible,
              textAlign: .start,
            ),
          ),
        ),
      ],
    );
  }
}
