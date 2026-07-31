import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
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
    final result = sendOtp.validate(event.phone);

    result.when(
      success: (data) => emit(
        state.copyWith(
          phone: event.phone,
          isValid: true,
          status: .idle,
          failure: null,
        ),
      ),
      error: (failure) => emit(
        state.copyWith(
          phone: event.phone,
          isValid: false,
          status: .idle,
          failure: failure,
        ),
      ),
    );
  }

  Future<void> _onGetCodePressed(
    GetCodePressed event,
    Emitter<EnterPhoneState> emit,
  ) async {
    emit(state.copyWith(status: .loading, failure: null));

    final result = await sendOtp.call(state.phone);
    result.when(
      success: (data) => emit(state.copyWith(status: .success)),
      error: (failure) =>
          emit(state.copyWith(status: .failure, failure: failure)),
    );
  }
}
