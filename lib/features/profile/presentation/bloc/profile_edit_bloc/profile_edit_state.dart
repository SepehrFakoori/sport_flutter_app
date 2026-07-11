import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';

enum SubmissionStatus { idle, loading, success, failure }

class ProfileEditState extends Equatable {
  final String value;
  final bool isValid;
  final SubmissionStatus status;
  final AppException? exception;

  const ProfileEditState({
    this.value = '',
    this.isValid = false,
    this.status = .idle,
    this.exception,
  });

  ProfileEditState copyWith({
    String? value,
    bool? isValid,
    SubmissionStatus? status,
    AppException? exception,
  }) {
    return ProfileEditState(
      value: value ?? this.value,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [value, isValid, status, exception];
}
