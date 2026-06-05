import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/features/inbox/presentations/widgets/chat_tile.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ChatTile(
        sender: 'سپهر فکوری',
        message: 'سلام بر همه عزیزان گروه چطورین؟',
        onTap: () {},
      ),
      separatorBuilder: (context, index) =>
          AppDivider(indent: 24, endIndent: 24),
      itemCount: 10,
    );
  }
}
