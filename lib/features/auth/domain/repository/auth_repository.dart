import 'package:sport_flutter_app/features/auth/domain/entity/auth_outcome.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phone);

  Future<AuthOutcome> verifyOtp(String phone, String code);
}
