import 'package:equatable/equatable.dart';

sealed class CompleteProfileEvent extends Equatable {
  const CompleteProfileEvent();

  @override
  List<Object?> get props => [];
}

class FirstNameChanged extends CompleteProfileEvent {
  final String firstName;

  const FirstNameChanged(this.firstName);

  @override
  List<Object?> get props => [firstName];
}

class LastNameChanged extends CompleteProfileEvent {
  final String lastName;

  const LastNameChanged(this.lastName);

  @override
  List<Object?> get props => [lastName];
}

class EmailChanged extends CompleteProfileEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class BirthDateChanged extends CompleteProfileEvent {
  final String birthDate;

  const BirthDateChanged(this.birthDate);

  @override
  List<Object?> get props => [birthDate];
}

class SubmitProfile extends CompleteProfileEvent {
  const SubmitProfile();
}
