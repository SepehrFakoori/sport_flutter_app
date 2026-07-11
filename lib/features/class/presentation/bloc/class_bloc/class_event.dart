import 'package:equatable/equatable.dart';

sealed class ClassEvent extends Equatable {
  const ClassEvent();

  @override
  List<Object?> get props => [];
}

class GetClass extends ClassEvent {
  final int id;

  const GetClass(this.id);

  @override
  List<Object?> get props => [id];
}
