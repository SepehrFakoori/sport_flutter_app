import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/features/chat/presentations/widgets/chat_list_tile.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> firstnames = ['سپهر', 'علی', 'سمیه', 'مصطفی', 'موسی'];

    final List<String> lastnames = [
      'فکوری',
      'محمدی',
      'آزادپور',
      'گریزمان',
      'موسی زاده',
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
          color: context.colors.onBackgroundSecondary,
        ),
        actions: [
          AppIconButton(
            icon: AssetIcons.search,
            onPressed: () {},
            tooltip: context.l10n.home_search_icon_tooltip,
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ChatListTile(
                firstname: 'پشتیبانی',
                lastname: 'اپلیکیشن',
                lastMessage:
                    'منتظرتم! یه ماتِ یوگا هم بیار منتظرتم! یه ماتِ یوگا هم بیار',
                type: .support,
              ),
              AppDivider(endIndent: 0, indent: 0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ChatListTile(
                  firstname: firstnames[index],
                  lastname: lastnames[index],
                  lastMessage:
                      'منتظرتم! یه ماتِ یوگا هم بیار منتظرتم! یه ماتِ یوگا هم بیار',
                  onTap: () {
                    context.pushNamed(AppRoutes.chat.name!);
                  },
                  type: index % 2 == 0 ? .coach : .user,
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
