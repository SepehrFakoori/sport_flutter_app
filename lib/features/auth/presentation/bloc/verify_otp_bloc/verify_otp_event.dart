import 'package:equatable/equatable.dart';

sealed class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object?> get props => [];
}

class VerifyPressed extends VerifyOtpEvent {
  final String phone;
  final String code;

  const VerifyPressed(this.phone, this.code);
}

class StartTimer extends VerifyOtpEvent {}

class TickTimer extends VerifyOtpEvent {}

class ResendOtpPressed extends VerifyOtpEvent {
  final String phone;

  const ResendOtpPressed(this.phone);

  @override
  List<Object?> get props => [phone];
}

class CompleteCode extends VerifyOtpEvent {
  final String phone;
  final String code;

  const CompleteCode(this.phone, this.code);

  @override
  List<Object?> get props => [phone, code];
}
