import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  const LogoutUseCase(this._repository);

  Future<Result<void>> call() => _repository.logout();
}
