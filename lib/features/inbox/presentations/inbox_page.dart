import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/inbox/presentations/widgets/chats_view.dart';
import 'package:sport_flutter_app/features/inbox/presentations/widgets/notifications_view.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
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
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
          ],
          body: TabBarView(
            controller: _controller,
            children: [ChatsView(), NotificationsView()],
          ),
        ),
      ),
    );
  }
}
