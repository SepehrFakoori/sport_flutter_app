import 'package:sport_flutter_app/core/exception/app_exception.dart';

abstract class AuthException extends AppException {}

class InvalidPhoneException implements AuthException {
  @override
  String? get message => throw UnimplementedError();
}
