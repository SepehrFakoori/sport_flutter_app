import 'package:sport_flutter_app/core/error/failure.dart';

/// Represents the outcome of an operation that can either succeed with
/// data of type [T] or fail with a [Failure].
///
/// Every repository method returns `Future<Result<T>>`. Use cases pass it
/// through unchanged; BLoCs are the layer responsible for turning a
/// [Failure] into a localized message (see [ResultX.when]).
sealed class Result<T> {
  const Result();

  /// True if this is a [Success]. Prefer [ResultX.when] or
  /// [ResultX.dataOrNull] over branching on this directly.
  bool get isSuccess => this is Success<T>;

  /// True if this is an [Error]. Prefer [ResultX.when] over branching
  /// on this directly.
  bool get isError => this is Error<T>;
}

/// A successful [Result] holding the resulting [data].
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

/// A failed [Result] holding the [failure] that describes what went wrong.
class Error<T> extends Result<T> {
  final Failure failure;

  const Error(this.failure);
}
