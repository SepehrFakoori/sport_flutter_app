import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class InitState extends HomeState {
  const InitState();
}

class LoadingState extends HomeState {
  const LoadingState();
}

class SuccessState extends HomeState {
  final List<Coach> coaches;
  final List<Class> classes;

  const SuccessState({required this.coaches, required this.classes});

  @override
  List<Object?> get props => [coaches, classes];
}

class FailureState extends HomeState {}
