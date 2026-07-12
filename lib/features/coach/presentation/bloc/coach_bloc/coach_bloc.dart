import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/use_case/get_coach_usecase.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_event.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_state.dart';

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  final GetCoachUseCase getCoach;

  CoachBloc(this.getCoach) : super(const InitState()) {
    on<GetCoach>(_onGetProfile);
  }

  Future<void> _onGetProfile(GetCoach event, Emitter<CoachState> emit) async {
    emit(const LoadingState());
    try {
      final Coach coach = await getCoach.call(event.id);
      emit(SuccessState(coach));
    } on AppException {
      emit(FailureState());
    }
  }
}
