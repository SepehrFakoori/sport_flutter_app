import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/inbox/presentation/widgets/chat_tile.dart';
import 'package:sport_flutter_app/features/inbox/presentation/widgets/chat_tile_skeleton.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppSliverAppBar(title: context.l10n.bottom_navigation_inbox),
            if (false)
              SliverList.separated(
                itemBuilder: (context, index) => ChatTileSkeleton(),
                separatorBuilder: (context, index) =>
                    AppDivider(endIndent: 0, indent: 0),
                itemCount: 5,
              )
            else
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
        ),
      ),
    );
  }
}
