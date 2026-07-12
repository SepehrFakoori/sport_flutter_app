import 'package:equatable/equatable.dart';

sealed class CoachEvent extends Equatable {
  const CoachEvent();

  @override
  List<Object?> get props => [];
}

class GetCoach extends CoachEvent {
  final int id;

  const GetCoach(this.id);

  @override
  List<Object?> get props => [id];
}
