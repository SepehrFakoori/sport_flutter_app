import 'package:dio/dio.dart';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/utils/result.dart';

/// Mixed into repository implementations to wrap network/data calls in
/// a [Result], centralizing exception → [Failure] mapping so individual
/// repository methods don't each need their own try/catch.
///
/// ```dart
/// class ProfileRepositoryImpl with RepositoryHandler implements ProfileRepository {
///   Future<Result<ProfileModel>> getProfile() {
///     return execute(() => dioClient.get('/profile/'));
///   }
/// }
/// ```
mixin RepositoryHandler {
  /// Runs [action] and wraps the outcome in a [Result].
  ///
  /// - Returns [Success] with the resolved value if [action] completes
  ///   normally.
  /// - Returns [Error] with a [Failure] mapped from the specific
  ///   [DioException] type/status code if the network call fails.
  /// - Returns [Error] with a generic [ServerFailure] for any other
  ///   unexpected exception (parsing bugs, null errors, etc.) — these
  ///   should be rare and are worth logging when they happen.
  Future<Result<T>> execute<T>(Future<T> Function() action) async {
    try {
      return Success<T>(await action());
    } on DioException catch (e) {
      final some = Error<T>(_mapDioException(e));
      return some;
    } catch (e) {
      // TODO: log e/st (e.g. via a logging service) — this branch means
      // something unexpected happened outside the network layer.
      return Error<T>(ServerFailure());
    }
  }

  /// Maps a [DioException] to a specific [Failure] based on its type
  /// and, for HTTP errors, the response status code.
  Failure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutFailure();
      case DioExceptionType.connectionError:
        return NetworkFailure();
      default:
        switch (e.response?.statusCode) {
          case 401:
            return const UnauthorizedFailure();
          case 403:
            return const ForbiddenFailure();
          case 404:
            return const NotFoundFailure();
          case 429:
            return const RateLimitedFailure();
          case 422:
          case 400:
            return ValidationFailure(e.response?.data);
          default:
            return const ServerFailure();
        }
    }
  }
}
