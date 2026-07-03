import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;

  const VerifyOtpUseCase(this._repository);

  Future<void> call(String phone, String code) =>
      _repository.verifyOtp(phone, code);
}
