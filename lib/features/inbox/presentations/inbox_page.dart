import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/features/inbox/presentations/widgets/chat_tile.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 108,
                floating: true,
                title: Text(context.l10n.bottom_navigation_inbox),
                titleTextStyle: context.textTheme.headlineSmall,
                bottom: TabBar(
                  controller: _controller,
                  isScrollable: true,
                  padding: .symmetric(horizontal: 16),
                  tabs: [
                    Tab(text: context.l10n.inbox_message_tab_label),
                    Tab(text: context.l10n.inbox_notifications_tab_label),
                  ],
                  labelStyle: context.textTheme.titleMedium,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return ChatTile(
                    sender: 'سپهر فکوری',
                    message: 'سلام بر همه عزیزان گروه چطورین؟',
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) =>
                    AppDivider(indent: 24, endIndent: 24),
                itemCount: 3,
              ),
              ListView.builder(
                itemBuilder: (context, index) =>
                    Container(color: Colors.red, height: 48),
                itemCount: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
