import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';

enum SubmissionStatus { idle, loading, success, failure }

class EnterPhoneState extends Equatable {
  final String phone;
  final bool isValid;
  final SubmissionStatus status;
  final AppException? exception;

  const EnterPhoneState({
    this.phone = '',
    this.isValid = false,
    this.status = .idle,
    this.exception,
  });

  EnterPhoneState copyWith({
    String? phone,
    bool? isValid,
    SubmissionStatus? status,
    AppException? exception,
  }) {
    return EnterPhoneState(
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      exception: exception,
    );
  }

  @override
  List<Object?> get props => [phone, isValid, status, exception];
}
