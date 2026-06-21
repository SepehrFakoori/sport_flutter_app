import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  const SendOtpUseCase(this._repository);

  Future<void> call(String phone) => _repository.sendOtp(phone);
}
