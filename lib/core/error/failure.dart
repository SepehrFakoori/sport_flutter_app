abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure();
}

class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

class RateLimitedFailure extends Failure {
  const RateLimitedFailure();
}

class ValidationFailure extends Failure {
  final dynamic errors;

  const ValidationFailure(this.errors);
}
