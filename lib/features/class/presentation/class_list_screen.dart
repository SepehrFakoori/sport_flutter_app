import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_bloc.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_event.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_state.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_overview_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/skeleton/class_overview_list_skeleton.dart';

class ClassListScreen extends StatefulWidget {
  const ClassListScreen({super.key});

  @override
  State<ClassListScreen> createState() => _ClassListScreenState();
}

class _ClassListScreenState extends State<ClassListScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<ClassListBloc>().add(ClassesFetchRequested());
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
      context.read<ClassListBloc>().add(ClassesFetchRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ClassListBloc, ClassListState>(
          builder: (context, state) {
            if (state.status == .loading) {
              return ClassOverviewListSkeleton();
            }

            if (state.status == .failure && state.classes.isEmpty) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            }

            if (state.classes.isEmpty) {
              return const Center(child: Text('No classes found'));
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ClassListBloc>().add(ClassesRefreshRequested());
              },
              child: ListView.separated(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const .symmetric(vertical: 12),
                itemCount: state.hasReachedMax
                    ? state.classes.length
                    : state.classes.length + 1,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  if (index >= state.classes.length) {
                    return Center(
                      child: Padding(
                        padding: .all(8.0),
                        child: AppLoadingIndicator(
                          color: context.colors.primary,
                        ),
                      ),
                    );
                  }
                  final item = state.classes[index];
                  return ClassOverviewCard(
                    imageUrl:
                        'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
                    title: item.title,
                    coachName: item.coach.fullName,
                    rate: item.fee,
                    address: 'address',
                    day: 'item.day',
                    price: item.fee,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
