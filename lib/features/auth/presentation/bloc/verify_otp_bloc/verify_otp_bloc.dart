import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/verify_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpUseCase verifyOtp;

  VerifyOtpBloc(this.verifyOtp) : super(InitialState()) {
    on<VerifyPressed>(_onVerifyPressed);
  }

  Future<void> _onVerifyPressed(
    VerifyPressed event,
    Emitter<VerifyOtpState> emit,
  ) async {
    try {
      emit(LoadingState());
      await verifyOtp.call(event.phone, event.code);
      emit(SuccessState());
    } on Exception catch (e) {
      emit(FailureState(e.toString()));
    }
  }
}
