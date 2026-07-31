import 'package:sport_flutter_app/core/error/failure.dart';

/// Phone number is not exactly 11 digits.
class InvalidPhoneLengthFailure extends Failure {
  const InvalidPhoneLengthFailure();
}

/// Phone number doesn't start with the '09' mobile prefix.
class InvalidPhonePrefixFailure extends Failure {
  const InvalidPhonePrefixFailure();
}
