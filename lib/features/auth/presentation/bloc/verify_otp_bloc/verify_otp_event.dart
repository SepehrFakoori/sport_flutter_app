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
