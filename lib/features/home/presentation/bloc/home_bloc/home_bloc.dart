import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_classes_usecase.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/use_case/get_coaches_usecase.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetClassesUseCase getClasses;
  final GetCoachesUseCase getCoaches;

  HomeBloc({required this.getClasses, required this.getCoaches})
    : super(const InitState()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(
    FetchHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const LoadingState());

    final result = await Future.wait([
      getCoaches.call(page: 1, pageSize: 8),
      getClasses.call(page: 1, pageSize: 8),
    ]);

    final coachesResult = result[0] as Result<Paginated<Coach>>;
    final classesResult = result[1] as Result<Paginated<Class>>;

    if (coachesResult case Error(failure: final f)) {
      emit(FailureState());
      return;
    }

    if (classesResult case Error(failure: final f)) {
      emit(FailureState());
      return;
    }

    emit(
      SuccessState(
        coaches: (coachesResult as Success<Paginated<Coach>>).data.items,
        classes: (classesResult as Success<Paginated<Class>>).data.items,
      ),
    );
  }

  // Future<void> _onGetClasses(GetClasses event, Emitter<HomeState> emit) async {
  //   emit(const LoadingState());
  //
  //   final result = await getClasses.call(page: 1, pageSize: 10);
  //
  //   result.when(
  //     success: (Paginated<Class> classes) => emit(SuccessState(classes.items)),
  //     error: (failure) => emit(FailureState()),
  //   );
  // }
  //
  // Future<void> _onGetCoaches(GetCoaches event, Emitter<HomeState> emit) async {
  //   emit(const LoadingState());
  //
  //   final result = await getClasses.call(page: 1, pageSize: 10);
  //
  //   result.when(
  //     success: (Paginated<Class> classes) => emit(SuccessState(classes.items)),
  //     error: (failure) => emit(FailureState()),
  //   );
  // }
}
