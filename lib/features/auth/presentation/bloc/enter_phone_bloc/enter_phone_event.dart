import 'package:equatable/equatable.dart';

sealed class EnterPhoneEvent extends Equatable {
  const EnterPhoneEvent();

  @override
  List<Object?> get props => [];
}

class PhoneChanged extends EnterPhoneEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class GetCodePressed extends EnterPhoneEvent {
  const GetCodePressed();
}
