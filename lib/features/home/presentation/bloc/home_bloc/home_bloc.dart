import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_classes_usecase.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_event.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetClassesUseCase getClasses;

  HomeBloc(this.getClasses) : super(const InitState()) {
    on<GetClasses>(_onGetClasses);
  }

  Future<void> _onGetClasses(GetClasses event, Emitter<HomeState> emit) async {
    emit(const LoadingState());

    final result = await getClasses.call(page: 1, pageSize: 10);

    result.when(
      success: (Paginated<Class> classes) => emit(SuccessState(classes.items)),
      error: (failure) => emit(FailureState()),
    );
  }
}
