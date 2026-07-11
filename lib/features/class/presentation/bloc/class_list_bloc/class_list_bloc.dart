import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
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

    try {
      final result = await getClasses.call(page: state.currentPage + 1);
      final items = [...state.classes, ...result.items];
      emit(
        state.copyWith(
          status: .success,
          classes: items,
          currentPage: result.currentPage,
          hasReachedMax: !result.hasMore,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: .failure, errorMessage: e.message));
    }
  }

  Future<void> _onRefreshRequested(
    ClassesRefreshRequested event,
    Emitter<ClassListState> emit,
  ) async {
    emit(const ClassListState());
    add(ClassesFetchRequested());
  }
}
