import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

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
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(maxWidth: context.deviceWidth * 0.8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).copyWith(
                bottomRight: index % 2 == 0 ? Radius.circular(8) : Radius.zero,
                bottomLeft: index % 2 == 0 ? Radius.zero : Radius.circular(8),
              ),
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
