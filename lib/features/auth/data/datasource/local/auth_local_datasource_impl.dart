import 'package:sport_flutter_app/core/storage/device_id/device_id_storage.dart';
import 'package:sport_flutter_app/core/storage/token/token_storage.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/local/auth_local_datasource.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final TokenStorage _tokenStorage;
  final DeviceIdStorage _idStorage;

  const AuthLocalDatasourceImpl(this._tokenStorage, this._idStorage);

  @override
  Future<void> clearTokens() => _tokenStorage.clear();

  @override
  Future<String?> getAccessToken() => _tokenStorage.getAccessToken();

  @override
  Future<String?> getRefreshToken() => _tokenStorage.getRefreshToken();

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _tokenStorage.saveAccessToken(accessToken);
    await _tokenStorage.saveRefreshToken(refreshToken);
  }

  @override
  Future<String> getOrCreateDeviceId() async =>
      _idStorage.getOrCreateDeviceId();
}
