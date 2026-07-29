import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class InitState extends LocationState {
  const InitState();
}

class LoadingState extends LocationState {
  const LoadingState();
}

class SuccessState extends LoadingState {
  final Location cityItem;

  const SuccessState(this.cityItem);

  @override
  List<Object> get props => [cityItem];
}

class FailureState extends LoadingState {}
