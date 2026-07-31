import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/error/failure.dart';

enum SubmissionStatus { idle, loading, success, failure }

class EnterPhoneState extends Equatable {
  final String phone;
  final bool isValid;
  final SubmissionStatus status;
  final Failure? failure;

  const EnterPhoneState({
    this.phone = '',
    this.isValid = false,
    this.status = .idle,
    this.failure,
  });

  EnterPhoneState copyWith({
    String? phone,
    bool? isValid,
    SubmissionStatus? status,
    Failure? failure,
  }) {
    return EnterPhoneState(
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [phone, isValid, status, failure];
}
