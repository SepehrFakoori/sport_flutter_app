import 'package:sport_flutter_app/core/exception/app_exception.dart';

abstract class AuthException extends AppException {}

class InvalidPhonePrefixException extends AuthException {}

class InvalidPhoneLengthException extends AuthException {}
