import 'package:sport_flutter_app/core/storage/token_storage.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final TokenStorage _storage;

  const AuthLocalDatasourceImpl(this._storage);

  @override
  Future<void> clearTokens() => _storage.clear();

  @override
  Future<String?> getAccessToken() => _storage.getAccessToken();

  @override
  Future<String?> getRefreshToken() => _storage.getRefreshToken();

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.saveAccessToken(accessToken);
    await _storage.saveRefreshToken(refreshToken);
  }
}
