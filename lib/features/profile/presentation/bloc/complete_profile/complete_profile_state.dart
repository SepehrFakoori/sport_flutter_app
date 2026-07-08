import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';

enum SubmissionStatus { idle, loading, success, failure }

class CompleteProfileState extends Equatable {
  final String firstName;
  final bool isFirstNameValid;
  final String lastName;
  final bool isLastNameValid;
  final String? email;
  final bool isEmailValid;
  final String birthDate;
  final bool isBirthDateValid;
  final SubmissionStatus status;
  final AppException? exception;

  const CompleteProfileState({
    this.firstName = '',
    this.isFirstNameValid = false,
    this.lastName = '',
    this.isLastNameValid = false,
    this.email,
    this.isEmailValid = false,
    this.birthDate = '',
    this.isBirthDateValid = false,
    this.status = .idle,
    this.exception,
  });

  bool get isValid =>
      isFirstNameValid && isLastNameValid && isEmailValid && isBirthDateValid;

  CompleteProfileState copyWith({
    String? firstName,
    bool? isFirstNameValid,
    String? lastName,
    bool? isLastNameValid,
    String? email,
    bool? isEmailValid,
    String? birthDate,
    bool? isBirthDateValid,
    SubmissionStatus? status,
    AppException? exception,
  }) {
    return CompleteProfileState(
      firstName: firstName ?? this.firstName,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      lastName: lastName ?? this.lastName,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      email: email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      birthDate: birthDate ?? this.birthDate,
      isBirthDateValid: isBirthDateValid ?? this.isBirthDateValid,
      status: status ?? this.status,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    isFirstNameValid,
    lastName,
    isLastNameValid,
    email,
    isEmailValid,
    birthDate,
    isBirthDateValid,
    status,
    exception,
  ];
}
