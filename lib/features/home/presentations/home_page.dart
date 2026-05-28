import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/filter_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'پلی آن',
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: .w700,
              ),
            ),
            Row(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                IconWidget(
                  icon: AssetIcons.location,
                  height: 16,
                  width: 16,
                  color: context.colors.primary,
                ),
                Text('تهران، سعادت آباد'),
              ],
            ),
          ],
        ),
        titleTextStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.textSecondary,
        ),
        actions: [
          AppIconButton(
            icon: AssetIcons.search,
            onPressed: () {},
            tooltip: context.l10n.home_search_icon_tooltip,
          ),
          SizedBox(width: 8),
          AppIconButton(
            icon: AssetIcons.notification,
            onPressed: () {},
            tooltip: context.l10n.home_notifications_icon_tooltip,
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FilterTile(
                title: context.l10n.home_categories_title,
                onTap: () {},
              ),
              CategoryListView(itemCount: 8),
              FilterTile(title: context.l10n.home_popular_title, onTap: () {}),
              CategoryListView(itemCount: 8),
              FilterTile(
                title: context.l10n.home_nearby_popular_title,
                onTap: () {},
              ),
              CategoryListView(itemCount: 8),
              FilterTile(
                title: context.l10n.home_categories_title,
                onTap: () {},
              ),
              CategoryListView(itemCount: 8),
              FilterTile(title: context.l10n.home_popular_title, onTap: () {}),
              CategoryListView(itemCount: 8),
              FilterTile(
                title: context.l10n.home_nearby_popular_title,
                onTap: () {},
              ),
              CategoryListView(itemCount: 8),
            ],
          ),
        ),
      ),
    );
  }
}
