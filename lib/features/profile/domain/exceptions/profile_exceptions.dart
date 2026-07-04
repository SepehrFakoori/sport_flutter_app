import 'package:sport_flutter_app/core/exception/app_exception.dart';

abstract class ProfileExceptions extends AppException {}

class InvalidFirstNameLengthException extends ProfileExceptions {}

class InvalidLastNameLengthException extends ProfileExceptions {}

class InvalidEmailException extends ProfileExceptions {}
