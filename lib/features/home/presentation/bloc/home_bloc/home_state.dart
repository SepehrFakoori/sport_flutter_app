import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

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
  final List<Class> classes;

  const SuccessState(this.classes);
}

class FailureState extends HomeState {}
