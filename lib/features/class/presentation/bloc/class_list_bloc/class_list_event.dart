import 'package:equatable/equatable.dart';

sealed class ClassListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClassesFetchRequested extends ClassListEvent {}

class ClassesRefreshRequested extends ClassListEvent {}
