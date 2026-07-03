import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDataSource;
  final AuthLocalDatasource _localDataSource;

  const AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<void> sendOtp(String phone) => _remoteDataSource.sendOtp(phone);

  @override
  Future<void> verifyOtp(String phone, String code) async {
    final AuthModel authModel = await _remoteDataSource.verifyOtp(phone, code);
    await _localDataSource.saveTokens(
      authModel.accessToken,
      authModel.refreshToken,
    );
  }
}
