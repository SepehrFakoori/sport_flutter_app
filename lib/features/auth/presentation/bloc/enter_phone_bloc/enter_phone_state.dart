import 'package:equatable/equatable.dart';

enum SubmissionStatus { idle, loading, success, failure }

class EnterPhoneState extends Equatable {
  final String phone;
  final bool isValid;
  final SubmissionStatus status;
  final String? errorMessage;

  const EnterPhoneState({
    this.phone = '',
    this.isValid = false,
    this.status = .idle,
    this.errorMessage,
  });

  EnterPhoneState copyWith({
    String? phone,
    bool? isValid,
    SubmissionStatus? status,
    String? errorMessage,
  }) {
    return EnterPhoneState(
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [phone, isValid, status, errorMessage];
}
