abstract class AuthRepository {
  Future<void> sendOtp(String phone);

  Future<void> verifyOtp(String phone, String code);
}
