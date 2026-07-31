import 'package:sport_flutter_app/core/error/repository_handler.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth_outcome.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with RepositoryHandler implements AuthRepository {
  final AuthRemoteDatasource _remoteDataSource;
  final AuthLocalDatasource _localDataSource;

  const AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<void>> sendOtp(String phone) =>
      execute(() async => await _remoteDataSource.sendOtp(phone));

  @override
  Future<Result<AuthOutcome>> verifyOtp(String phone, String code) async {
    return execute(() async {
      final AuthModel authModel = await _remoteDataSource.verifyOtp(
        phone,
        code,
      );

      await _localDataSource.saveTokens(
        authModel.accessToken,
        authModel.refreshToken,
      );

      return authModel.isNewUser ? .profileCompletionRequired : .authenticated;
    });
  }

  @override
  Future<Result<void>> logout() async {
    return execute(() async {
      final String? refreshToken = await _localDataSource.getRefreshToken();

      try {
        if (refreshToken != null) {
          await _remoteDataSource.logout(refreshToken);
        }
      } catch (_) {
      } finally {
        // TODO: clear tokens and navigate to EnterPhoneScreen
        await _localDataSource.clearTokens();
      }
    });
  }
}
