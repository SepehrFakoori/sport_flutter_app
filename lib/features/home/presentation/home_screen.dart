import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_refresh_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_state.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/coach_overview.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/filter_tile.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/horizontal_class_card_list.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/coach_overview_skeleton.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/horizontal_class_card_list_skeleton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetClasses());
  }

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
        elevation: 0,
        shadowColor: Colors.transparent,
        titleTextStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colors.onBackgroundSecondary,
        ),
        actions: [
          AppIconButton(
            icon: AssetIcons.search,
            onPressed: () => context.pushNamed(AppRoutes.search.name!),
            tooltip: context.l10n.home_search_icon_tooltip,
          ),
          const SizedBox(width: 8),
          AppIconButton(
            icon: AssetIcons.notification,
            onPressed: () => context.pushNamed(AppRoutes.notifications.name!),
            tooltip: context.l10n.home_notifications_icon_tooltip,
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(color: Colors.blue, height: 100),
            ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: AppSliverPersistentHeaderDelegate(
                child: Container(color: context.colors.primary),
                minHeight: 56,
                maxHeight: 112,
              ),
            ),
          ],
          body: AppRefreshIndicator(
            onRefresh: () async => context.read<HomeBloc>().add(GetClasses()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FilterTile(
                    title: context.l10n.home_categories_title,
                    onTap: () {},
                  ),
                  CategoryListView(),
                  const SizedBox(height: 16),
                  FilterTile(
                    title: context.l10n.home_categories_title,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return index % 2 == 0
                            ? CoachOverview(
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.coach.name!,
                                    pathParameters: {'id': '1'},
                                  );
                                },
                                imageUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjIjnCa4QxghR2hY_2NGc_y5xN7ZT_aXe__g4r4natMHrosGqVhTzKkSzK&s=10',
                                      coachName: 'محمود اسکندری',
                                coachComment: 126,
                                rate: 4.2,
                                coachSport: 'وزنه برداری',
                              )
                            : const CoachOverviewSkeleton();
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 12,),
                      itemCount: 8,
                      padding: const .symmetric(horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilterTile(
                    title: context.l10n.home_popular_title,
                    onTap: () {
                      context.pushNamed(AppRoutes.classes.name!);
                    },
                  ),
                  SizedBox(
                    height: 293,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is SuccessState) {
                          return HorizontalClassCardList(
                            classes: state.classes,
                          );
                        } else {
                          return HorizontalClassCardListSkeleton();
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 21 / 9,
                    child: Container(
                      margin: const .symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: .circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilterTile(
                    title: context.l10n.home_nearby_popular_title,
                    onTap: () {
                      context.pushNamed(AppRoutes.auth.name!);
                    },
                  ),
                  SizedBox(
                    height: 293,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is SuccessState) {
                          return HorizontalClassCardList(
                            classes: state.classes,
                          );
                        } else {
                          return HorizontalClassCardListSkeleton();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  const AppSliverPersistentHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  }) : assert(maxHeight >= minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Current height as the user scrolls: goes from maxHeight -> minHeight
    final double currentHeight = (maxHeight - shrinkOffset).clamp(
      minHeight,
      maxHeight,
    );

    return SizedBox(height: currentHeight, child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant AppSliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight;
  }
}
