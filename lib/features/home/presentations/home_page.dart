import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/filter_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
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
            ],
          ),
        ),
      ),
    );
  }
}
