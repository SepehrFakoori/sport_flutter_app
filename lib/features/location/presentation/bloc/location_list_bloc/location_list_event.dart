import 'package:equatable/equatable.dart';

sealed class LocationListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CitiesFetchRequested extends LocationListEvent {}

class CitiesRefreshRequested extends LocationListEvent {}

class CitiesSearchRequested extends LocationListEvent {
  final String value;

  CitiesSearchRequested(this.value);

  @override
  List<Object?> get props => [value];
}