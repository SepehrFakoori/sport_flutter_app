import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/utils/result.dart';

extension ResultExtensions<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    return switch (this) {
      Success(:final data) => success(data),
      Error(:final failure) => error(failure),
    };
  }
}
