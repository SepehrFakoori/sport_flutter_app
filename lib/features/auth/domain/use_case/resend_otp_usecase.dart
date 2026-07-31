import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository _repository;

  const ResendOtpUseCase(this._repository);

  Future<Result<void>> call(String phone) => _repository.sendOtp(phone);
}
