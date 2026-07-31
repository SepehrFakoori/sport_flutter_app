import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  const SendOtpUseCase(this._repository);

  void validate(String phone) {
    if (!phone.startsWith('09') && phone.length >= 2) {
      throw InvalidPhonePrefixException();
    } else if (phone.length != 11) {
      throw InvalidPhoneLengthException();
    }
  }

  Future<Result<void>> call(String phone) => _repository.sendOtp(phone);
}
