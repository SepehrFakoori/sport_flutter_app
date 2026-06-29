import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/inbox/presentations/chats_page.dart';
import 'package:sport_flutter_app/features/inbox/presentations/notifications_page.dart';

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
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            AppSliverAppBar(
              title: context.l10n.bottom_navigation_inbox,
              child: TabBar(
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
            SliverFillRemaining(
              child: TabBarView(
                controller: _controller,
                children: [
                  ChatsPage(),
                  NotificationsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
