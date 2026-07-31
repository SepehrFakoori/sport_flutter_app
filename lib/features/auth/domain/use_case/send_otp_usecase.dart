import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/domain/failure/auth_failure.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  const SendOtpUseCase(this._repository);

  Result<void> validate(String phone) {
    // phone.length >= 2
    if (!phone.startsWith('09')) return Error(InvalidPhonePrefixFailure());
    if (phone.length != 11) return Error(InvalidPhoneLengthFailure());
    return Success<void>(null);
  }

  Future<Result<void>> call(String phone) => _repository.sendOtp(phone);
}
