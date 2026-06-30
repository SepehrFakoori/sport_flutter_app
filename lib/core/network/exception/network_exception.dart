import 'package:sport_flutter_app/core/exception/app_exception.dart';

sealed class ServerException extends AppException {
  const ServerException([super.message]);
}

// 4XX
class BadRequestException extends ServerException {
  // 400
  const BadRequestException() : super('Bad request');
}

class UnauthorizedException extends ServerException {
  // 401
  const UnauthorizedException() : super('Unauthorize request');
}

class ForbiddenException extends ServerException {
  // 403
  const ForbiddenException() : super('The request is forbidden');
}

class NotFoundException extends ServerException {
  // 404
  const NotFoundException() : super('The property not found');
}

class MethodNotAllowedException extends ServerException {
  // 405
  const MethodNotAllowedException() : super('Request method is wrong');
}

class RequestTimeoutException extends ServerException {
  // 408
  const RequestTimeoutException() : super('Request timed out');
}

class ConflictException extends ServerException {
  // 409
  const ConflictException() : super('Request has conflict');
}

class UnprocessableEntityException extends ServerException {
  // 422
  const UnprocessableEntityException() : super('The property not found');
}

class TooManyRequestException extends ServerException {
  // 429
  const TooManyRequestException() : super('Too many request');
}

// 5XX
class InternalServerErrorException extends ServerException {
  // 500
  const InternalServerErrorException() : super('Server error');
}

class BadGatewayException extends ServerException {
  // 502
  const BadGatewayException() : super('Bad gateway');
}
