import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/class_card.dart';
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
          color: context.colors.onBackgroundSecondary,
        ),
        actions: [
          AppIconButton(
            icon: AssetIcons.search,
            onPressed: () {
              context.pushNamed(
                AppRoutes.coach.name!,
                pathParameters: {'id': '10'},
              );
            },
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
              CategoryListView(),
              FilterTile(title: context.l10n.home_popular_title, onTap: () {}),
              ClassListView(),
              SizedBox(height: 16),
              FilterTile(
                title: context.l10n.home_nearby_popular_title,
                onTap: () {},
              ),
              ClassListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassListView extends StatelessWidget {
  const ClassListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => ClassCard(
          imageUrl:
              'https://teempo.ir/wp-content/uploads/2025/04/167027126-H-1024x700-copy.webp',
          title: 'یوگا صبحگاهی',
          firstname: 'فاطمه',
          lastname: 'اکبری',
          location: 'تهران، سعادت آباد',
          capacity: 20,
          remaining: 16,
          cost: '1,800,000',
        ),
      ),
    );
  }
}
