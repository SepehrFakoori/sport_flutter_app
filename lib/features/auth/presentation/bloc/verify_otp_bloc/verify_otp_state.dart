import 'package:equatable/equatable.dart';

class VerifyOtpState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  final int remainingSeconds;
  final bool canResend;

  const VerifyOtpState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.remainingSeconds = 120,
    this.canResend = false,
  });

  VerifyOtpState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
    int? remainingSeconds,
    bool? canResend,
  }) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSuccess,
    error,
    remainingSeconds,
    canResend,
  ];
}

// sealed class VerifyOtpState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class InitialState extends VerifyOtpState {}
//
// class LoadingState extends VerifyOtpState {}
//
// class SuccessState extends VerifyOtpState {}
//
// class FailureState extends VerifyOtpState {
//   final String message;
//
//   FailureState(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }
