import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

sealed class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object?> get props => [];
}

class InitState extends ClassState {
  const InitState();
}

class LoadingState extends ClassState {
  const LoadingState();
}

class SuccessState extends ClassState {
  final Class classItem;

  const SuccessState(this.classItem);

  @override
  List<Object?> get props => [classItem];
}

class FailureState extends ClassState {}
