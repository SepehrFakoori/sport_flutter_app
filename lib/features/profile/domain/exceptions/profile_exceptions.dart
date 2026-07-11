import 'package:sport_flutter_app/core/exception/app_exception.dart';

abstract class ProfileExceptions extends AppException {}

class EmptyFieldException extends ProfileExceptions {}

class InvalidFirstNameException extends ProfileExceptions {}

class InvalidLastNameException extends ProfileExceptions {}

class InvalidEmailException extends ProfileExceptions {}

class InvalidBirthDateException extends ProfileExceptions {}
