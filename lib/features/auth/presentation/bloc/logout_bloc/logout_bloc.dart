import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/logout_usecase.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase logout;

  LogoutBloc(this.logout) : super(const InitState()) {
    on<Logout>(_onLogout);
  }

  Future<void> _onLogout(Logout event, Emitter<LogoutState> emit) async {
    emit(const LoadingState());
    try {
      await logout.call();
      emit(const SuccessState());
    } on AppException {
      emit(const FailureState());
    }
  }
}
