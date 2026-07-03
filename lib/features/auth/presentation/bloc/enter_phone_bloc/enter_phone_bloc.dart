import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/send_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_state.dart';

class EnterPhoneBloc extends Bloc<EnterPhoneEvent, EnterPhoneState> {
  final SendOtpUseCase sendOtp;

  EnterPhoneBloc(this.sendOtp) : super(const EnterPhoneState()) {
    on<PhoneChanged>(_onPhoneChanged);
    on<GetCodePressed>(_onGetCodePressed);
  }

  Future<void> _onPhoneChanged(
    PhoneChanged event,
    Emitter<EnterPhoneState> emit,
  ) async {
    try {
      sendOtp.validate(event.phone);
      emit(
        state.copyWith(
          phone: event.phone,
          isValid: true,
          status: .idle,
          exception: null,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          phone: event.phone,
          isValid: false,
          status: .idle,
          exception: e,
        ),
      );
    }
  }

  Future<void> _onGetCodePressed(
    GetCodePressed event,
    Emitter<EnterPhoneState> emit,
  ) async {
    emit(state.copyWith(status: .loading));
    try {
      await sendOtp.call(state.phone);
      emit(state.copyWith(status: .success));
    } on AppException catch (e) {
      emit(state.copyWith(status: .failure, exception: e));
    }
  }
}
