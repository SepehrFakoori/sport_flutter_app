import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';

abstract class AuthRemoteDatasource {
  Future<void> sendOtp(String phone);

  Future<AuthModel> verifyOtp(String phone, String code);

  Future<void> logout(String refreshToken);
}
