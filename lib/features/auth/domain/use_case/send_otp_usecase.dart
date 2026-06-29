import 'package:sport_flutter_app/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  const SendOtpUseCase(this._repository);

  void validate(String phone) {
    if (phone.isEmpty) throw PhoneEmptyException();
    if (phone.startsWith('09')) throw PhoneInvalidPrefixException();
    if (phone.length != 11) throw PhoneInvalidLengthException();
  }

  Future<void> call(String phone) => _repository.sendOtp(phone);
}
