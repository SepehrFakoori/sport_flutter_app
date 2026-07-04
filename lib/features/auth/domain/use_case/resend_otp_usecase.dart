import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository _repository;

  const ResendOtpUseCase(this._repository);

  Future<void> call(String phone) => _repository.sendOtp(phone);
}
