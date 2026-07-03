import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_state.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/category_list.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/class_card.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/filter_tile.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/skeleton/class_card_skeleton.dart';

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
          const SizedBox(width: 8),
          AppIconButton(
            icon: AssetIcons.notification,
            onPressed: () {},
            tooltip: context.l10n.home_notifications_icon_tooltip,
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: SafeArea(
        child: RefreshIndicator(
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
                  title: context.l10n.home_popular_title,
                  onTap: () {},
                ),
                SizedBox(
                  height: 293,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsetsGeometry.symmetric(
                            horizontal: 24,
                          ),
                          itemBuilder: (context, index) => ClassCard(
                            imageUrl:
                                'https://kavaalya.com/wp-content/uploads/2021/05/sukhasana-kavaalya.jpeg',
                            title: state.classes[index].title,
                            coachName: state.classes[index].coach.fullName,
                            rate: '4.1',
                            address: 'قزوین، زیباشهر',
                            cost: '${state.classes[index].fee} تومان',
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: state.classes.length,
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsetsGeometry.symmetric(
                            horizontal: 24,
                          ),
                          itemBuilder: (context, index) => ClassCardSkeleton(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: 8,
                        );
                      }
                    },
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
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
                    itemBuilder: (context, index) => ClassCard(
                      imageUrl:
                          'https://kavaalya.com/wp-content/uploads/2021/05/sukhasana-kavaalya.jpeg',
                      title: 'تکواندو فرکانس',
                      coachName: 'میعاد جاوید',
                      rate: '4.1',
                      address: 'قزوین، زیباشهر',
                      cost: '560.000 تومان',
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
