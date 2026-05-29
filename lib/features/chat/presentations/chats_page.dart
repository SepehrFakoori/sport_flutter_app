import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              context.l10n.chat_list_appbar_title,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: .w700,
              ),
            ),
            Text(context.l10n.chat_list_appbar_subtitle(5)),
          ],
        ),
        titleTextStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ChatListTile(
                  username: usernames[index],
                  subtitle: 'مربی بدنسازی',
                  onTap: () {
                    context.pushNamed(AppRoutes.chat.name!);
                  },
                ),
                separatorBuilder: (context, index) =>
                    const AppDivider(endIndent: 0, indent: 0),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
