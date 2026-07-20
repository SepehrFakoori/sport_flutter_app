import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_refresh_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/chips/app_filter_chip.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_state.dart';
import 'package:sport_flutter_app/features/ads/presentation/widgets/app_banner_carousel.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/filter_tile.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/horizontal_class_card_list.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/horizontal_coach_card_list.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/home_content_skeleton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? value = 1;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchHomeData());
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'رزمی',
      'توپی',
      'آبی',
      'راکتی',
      'بدنسازی و فیتنس',
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
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
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: AppSliverPersistentHeaderDelegate(
                child: Container(
                  color: context.colors.background,
                  child: ListView.separated(
                    scrollDirection: .horizontal,
                    padding: const .symmetric(horizontal: 16),
                    itemBuilder: (context, index) => AppFilterChip(
                      title: categories[index],
                      url: 'https://www.svgrepo.com/show/355292/swim.svg',
                      selected: index % 2 == 0,
                      onSelected: (bool value) => print(value),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: categories.length,
                  ),
                ),
                height: 48,
              ),
            ),
          ],
          body: AppRefreshIndicator(
            onRefresh: () async =>
                context.read<HomeBloc>().add(FetchHomeData()),
            child: SingleChildScrollView(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return switch (state) {
                    InitState() || LoadingState() => HomeContentSkeleton(),
                    SuccessState(:final coaches, :final classes) => Column(
                      children: [
                        const SizedBox(height: 8),
                        AppBannerCarousel(
                          imageUrls: [
                            'https://img.magnific.com/free-vector/gradient-neon-gym-training-facebook-template_23-2149609440.jpg?semt=ais_hybrid&w=740&q=80',
                            'https://img.magnific.com/free-psd/gym-fitness-web-banner-template_106176-5324.jpg?semt=ais_hybrid&w=740&q=80',
                            'https://img.magnific.com/free-vector/green-wavy-sport-banner_1409-956.jpg?semt=ais_hybrid&w=740&q=80',
                          ],
                          onTap: () {},
                        ),
                        const SizedBox(height: 16),
                        FilterTile(
                          title: context.l10n.home_nearby_classes_title,
                          onTap: () {
                            context.pushNamed(AppRoutes.classes.name!);
                          },
                        ),
                        SizedBox(
                          height: 293,
                          child: HorizontalClassCardList(classes: classes),
                        ),
                        const SizedBox(height: 16),
                        FilterTile(
                          title: context.l10n.home_nearby_coaches_title,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 270,
                          child: HorizontalCoachCardList(coaches: coaches),
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
                          child: HorizontalClassCardList(classes: classes),
                        ),
                      ],
                    ),
                    FailureState() => SizedBox.shrink(),
                  };
                },
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
  final double height;

  // final double maxHeight = 48 * 2;
  // final double minHeight = 48;

  const AppSliverPersistentHeaderDelegate({
    required this.child,
    required this.height,
    // required this.maxHeight,
    // required this.minHeight,
  }); // : assert(maxHeight >= minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Current height as the user scrolls: goes from maxHeight -> minHeight
    // final double currentHeight = (maxHeight - shrinkOffset).clamp(
    //   minHeight,
    //   maxHeight,
    // );

    return SizedBox(height: height, child: child);
  }

  @override
  double get maxExtent => height; // maxHeight;

  @override
  double get minExtent => height; // minHeight;

  @override
  bool shouldRebuild(covariant AppSliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
