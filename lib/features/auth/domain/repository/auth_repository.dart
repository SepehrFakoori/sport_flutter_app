import 'package:sport_flutter_app/features/auth/domain/entity/auth.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phone);

  Future<Auth> verifyOtp(String phone, String code);
}
