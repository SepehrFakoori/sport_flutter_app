import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/features/inbox/presentations/widgets/chat_tile.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemBuilder: (context, index) => ChatTile(
            sender: 'سپهر فکوری',
            message: 'سلام بر همه عزیزان گروه چطورین؟',
            onTap: () {},
          ),
          separatorBuilder: (context, index) =>
              AppDivider(endIndent: 0, indent: 0),
          itemCount: 10,
        ),
        SliverToBoxAdapter(child: SizedBox(height: 96)),
      ],
    );
  }
}
