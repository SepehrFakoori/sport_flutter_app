import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/coach_tile.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/filter_tile.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/rating_chip.dart';

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
              Column(
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  ImageLoader(
                    imageUrl:
                        'https://westwood.ie/img/asset/aW1hZ2VzL2JveGZpdC1hdC13ZXN0LXdvb2QtY2x1Yi5qcGc/boxfit-at-west-wood-club.jpg?fit=contain&fm=webp&q=90&w=1234&h=823&s=788b6ff3fd5f327f9b722c6de2dd4838',
                    height: 180,
                    width: 280,
                  ),
                  Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    spacing: 8,
                    children: [
                      CoachTile(
                        imageUrl:
                            'https://b1803438.smushcdn.com/1803438/wp-content/uploads/2014/10/male-soccer-or-football-coach-standing-on-the-sideline-watching-127131449-copy.jpg?lossy=1&strip=1&webp=1',
                        username: 'سید علی حسینی',
                        radius: 20,
                      ),
                      RatingChip(rate: 4.5),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
