import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_classes_usecase.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_event.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_state.dart';

class ClassListBloc extends Bloc<ClassListEvent, ClassListState> {
  final GetClassesUseCase getClasses;

  ClassListBloc(this.getClasses) : super(const ClassListState()) {
    on<ClassesFetchRequested>(_onFetchRequested);
    on<ClassesRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onFetchRequested(
    ClassesFetchRequested event,
    Emitter<ClassListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final isFirstPage = state.currentPage == 0;
    emit(state.copyWith(status: isFirstPage ? .loading : .loadingMore));

    final result = await getClasses.call(page: state.currentPage + 1);

    result.when(
      success: (data) {
        final items = [...state.classes, ...data.items];

        emit(
          state.copyWith(
            status: .success,
            classes: items,
            currentPage: data.currentPage,
            hasReachedMax: !data.hasMore,
          ),
        );
      },
      error: (failure) =>
          emit(state.copyWith(status: .failure, errorMessage: failure.message)),
    );
  }

  Future<void> _onRefreshRequested(
    ClassesRefreshRequested event,
    Emitter<ClassListState> emit,
  ) async {
    emit(const ClassListState());
    add(ClassesFetchRequested());
  }
}
