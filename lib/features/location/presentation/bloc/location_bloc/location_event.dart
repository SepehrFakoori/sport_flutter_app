import 'package:equatable/equatable.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetCity extends LocationEvent {
  final String city;

  const GetCity(this.city);

  @override
  List<Object?> get props => [city];
}
