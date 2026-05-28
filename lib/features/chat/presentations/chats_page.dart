import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/features/chat/presentations/widgets/chat_list_tile.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> usernames = [
      'سپهر فکوری',
      'علی محمدی',
      'سمیه آزادپور',
      'مصطفی گریزمان',
      'موسی موسی زاده',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ChatListTile(
                username: usernames[index],
                subtitle: 'مربی بدنسازی',
              ),
              separatorBuilder: (context, index) =>
                  const AppDivider(endIndent: 0, indent: 0),
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
