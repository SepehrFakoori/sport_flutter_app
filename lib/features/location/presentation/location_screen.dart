import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_bloc.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_event.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_state.dart';
import 'package:sport_flutter_app/features/location/presentation/widgets/city_tile.dart';
import 'package:sport_flutter_app/features/location/presentation/widgets/skeleton/city_tile_skeleton.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<LocationListBloc>().add(CitiesFetchRequested());
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final threshold = _scrollController.position.maxScrollExtent - 200;
    if (_scrollController.position.pixels >= threshold) {
      context.read<LocationListBloc>().add(CitiesFetchRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        shadowColor: Colors.transparent,
        title: Text(
          context.l10n.location_appbar_title,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .max,
          children: [
            Padding(
              padding: const .all(AppSpacing.lg),
              child: AppTextFormField(
                labelText: context.l10n.location_search_city_label,
                keyboardType: .name,
                textInputAction: .done,
                onChange: (value) => context.read<LocationListBloc>().add(
                  CitiesSearchRequested(value),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              contentPadding: const .symmetric(horizontal: AppSpacing.lg),
              minLeadingWidth: 20,
              minVerticalPadding: 8,
              minTileHeight: 48,
              horizontalTitleGap: 16,
              title: Text(
                context.l10n.location_select_my_current_city,
                style: context.textTheme.titleMedium,
              ),
              leading: IconWidget(icon: AppIcons.locationFilled, size: 20),
            ),
            Expanded(
              child: BlocBuilder<LocationListBloc, LocationListState>(
                builder: (context, state) {
                  if (state.status == .loading) {
                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => CityTileSkeleton(),
                      separatorBuilder: (context, index) =>
                          AppDivider(endIndent: 16, indent: 16),
                      itemCount: 8,
                    );
                  }
                  if (state.cities.isEmpty) {
                    return const Center(child: Text('No cities found'));
                  }

                  if (state.status == .failure) {
                    return Center(
                      child: Text(state.errorMessage ?? 'Something went wrong'),
                    );
                  }
                  final cities = state.cities;
                  return ListView.separated(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index >= state.cities.length) {
                        return Center(
                          child: Padding(
                            padding: .all(8.0),
                            child: AppLoadingIndicator(
                              color: context.colors.primary,
                            ),
                          ),
                        );
                      }
                      final city = cities[index];
                      return CityTile(city: city);
                    },
                    separatorBuilder: (context, index) =>
                        AppDivider(endIndent: 16, indent: 16),
                    itemCount: state.hasReachedMax
                        ? state.cities.length
                        : state.cities.length + 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
