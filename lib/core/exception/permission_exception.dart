import 'package:sport_flutter_app/core/exception/app_exception.dart';

abstract class AppPermissionException extends AppException {}

class PermissionDeniedException extends AppPermissionException {}

class ImagePickCancelledException extends AppPermissionException {}

class ImagePickFailedException extends AppPermissionException {}
