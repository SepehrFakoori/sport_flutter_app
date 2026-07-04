import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/resend_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/verify_otp_usecase.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpUseCase verifyOtp;
  final ResendOtpUseCase resendOtp;

  Timer? _timer;
  static const int _resendTime = 120;

  VerifyOtpBloc({required this.verifyOtp, required this.resendOtp})
    : super(const VerifyOtpState()) {
    on<VerifyPressed>(_onVerifyPressed);
    on<StartTimer>(_onStartTimer);
    on<TickTimer>(_onTickTimer);
    on<ResendOtpPressed>(_onResendOtpPressed);
    on<CompleteCode>(_onCompleteCode);
  }

  Future<void> _onVerifyPressed(
    VerifyPressed event,
    Emitter<VerifyOtpState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      await verifyOtp.call(event.phone, event.code);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on Exception catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onCompleteCode(
    CompleteCode event,
    Emitter<VerifyOtpState> emit,
  ) async {
    if (event.code.length == 6) {
      add(VerifyPressed(event.phone, event.code));
    }
  }

  void _onStartTimer(StartTimer event, Emitter<VerifyOtpState> emit) {
    _timer?.cancel();

    emit(state.copyWith(remainingSeconds: _resendTime, canResend: false));

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => add(TickTimer()),
    );
  }

  void _onTickTimer(TickTimer event, Emitter<VerifyOtpState> emit) {
    if (state.remainingSeconds > 1) {
      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    } else {
      _timer?.cancel();

      emit(state.copyWith(remainingSeconds: 0, canResend: true));
    }
  }

  Future<void> _onResendOtpPressed(
    ResendOtpPressed event,
    Emitter<VerifyOtpState> emit,
  ) async {
    try {
      await resendOtp.call(event.phone);
      add(StartTimer());
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
