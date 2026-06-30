import 'package:sport_flutter_app/core/exceptions/app_exception.dart';

abstract class NetworkException extends AppException {
  const NetworkException(super.message, [super.stackTrace]);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException({required String message}) : super(message);
}
