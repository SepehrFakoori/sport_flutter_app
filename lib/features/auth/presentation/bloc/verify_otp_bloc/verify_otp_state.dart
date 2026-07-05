import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth_outcome.dart';

class VerifyOtpState extends Equatable {
  final bool isLoading;
  final AuthOutcome? outcome;
  final String? error;
  final int remainingSeconds;
  final bool canResend;

  const VerifyOtpState({
    this.isLoading = false,
    this.outcome,
    this.error,
    this.remainingSeconds = 120,
    this.canResend = false,
  });

  VerifyOtpState copyWith({
    bool? isLoading,
    AuthOutcome? outcome,
    String? error,
    int? remainingSeconds,
    bool? canResend,
  }) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      outcome: outcome,
      error: error,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    outcome,
    error,
    remainingSeconds,
    canResend,
  ];
}
