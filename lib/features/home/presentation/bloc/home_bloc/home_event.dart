import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchHomeData extends HomeEvent {}

class GetClasses extends HomeEvent {}

class GetCoaches extends HomeEvent {}
