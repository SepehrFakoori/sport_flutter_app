import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/utils/result.dart';

/// Utility methods for working with [Result] without manually branching
/// on `is Success` / `is Error`.
extension ResultX<T> on Result<T> {
  /// Unwraps the [Result], calling [success] with the data or [error]
  /// with the failure, and returning whatever each callback produces.
  ///
  /// This is the primary way BLoCs should consume a repository call —
  /// it forces you to handle both branches, so you can't accidentally
  /// forget to handle an error case.
  ///
  /// ```dart
  /// final result = await repository.fetchProfile();
  /// result.when(
  ///   success: (profile) => emit(state.copyWith(profile: profile)),
  ///   error: (failure) => emit(state.copyWith(errorMessage: failure.toLocalizedMessage(context))),
  /// );
  /// ```
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) => switch (this) {
    Success(:final data) => success(data),
    Error(:final failure) => error(failure),
  };

  /// Returns the data if this is a [Success], otherwise `null`.
  ///
  /// Use this when you don't care *why* something failed, just whether
  /// you have usable data — e.g. logging, analytics, or a fallback UI
  /// that just shows "no data" without a specific error message.
  ///
  /// ```dart
  /// final cachedName = (await repository.fetchProfile()).dataOrNull?.name;
  /// ```
  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Error() => null,
  };

  /// Transforms the success value from [T] to [R] without unwrapping
  /// the [Result] — a failed [Result] passes its [Failure] through
  /// unchanged.
  ///
  /// Use this at layer boundaries (e.g. data → domain) to convert a
  /// `Result<Model>` into a `Result<Entity>` without writing a `when`
  /// just to rewrap the value.
  ///
  /// ```dart
  /// Future<Result<ProfileEntity>> getProfile() async {
  ///   final result = await execute(() => api.fetchProfile());
  ///   return result.map((model) => model.toDomain());
  /// }
  /// ```
  Result<R> map<R>(R Function(T data) transform) => switch (this) {
    Success(:final data) => Success(transform(data)),
    Error(:final failure) => Error(failure),
  };

  /// Like [when] but with positional callbacks — convenient for short,
  /// same-shaped transformations.
  R fold<R>(R Function(Failure) onError, R Function(T) onSuccess) =>
      switch (this) {
        Success(:final data) => onSuccess(data),
        Error(:final failure) => onError(failure),
      };

  /// Returns the data if [Success], otherwise the result of [orElse].
  T getOrElse(T Function() orElse) => switch (this) {
    Success(:final data) => data,
    Error() => orElse(),
  };
}
