import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

sealed class CoachState extends Equatable {
  const CoachState();

  @override
  List<Object?> get props => [];
}

class InitState extends CoachState {
  const InitState();
}

class LoadingState extends CoachState {
  const LoadingState();
}

class SuccessState extends CoachState {
  final Coach coach;

  const SuccessState(this.coach);
}

class FailureState extends CoachState {}
