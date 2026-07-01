import 'package:equatable/equatable.dart';

sealed class VerifyOtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends VerifyOtpState {}

class LoadingState extends VerifyOtpState {}

class SuccessState extends VerifyOtpState {}

class FailureState extends VerifyOtpState {
  final String message;

  FailureState(this.message);

  @override
  List<Object?> get props => [message];
}
