import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth_outcome.dart';

abstract class AuthRepository {
  Future<Result<void>> sendOtp(String phone);

  Future<Result<AuthOutcome>> verifyOtp(String phone, String code);

  Future<Result<void>> logout();
}
