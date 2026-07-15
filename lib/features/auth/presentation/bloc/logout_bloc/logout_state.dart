sealed class LogoutState {
  const LogoutState();
}

final class InitState extends LogoutState {
  const InitState();
}

final class LoadingState extends LogoutState {
  const LoadingState();
}

final class SuccessState extends LogoutState {
  const SuccessState();
}

final class FailureState extends LogoutState {
  const FailureState();
}
