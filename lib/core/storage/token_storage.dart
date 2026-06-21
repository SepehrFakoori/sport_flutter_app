import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth.dart';

abstract class TokenStorage {
  Future<void> save(Auth auth);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> clear();
}

class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage _storage;

  const TokenStorageImpl(this._storage);

  @override
  Future<void> clear() => _storage.deleteAll();

  @override
  Future<String?> getAccessToken() => _storage.read(key: 'access_token');

  @override
  Future<String?> getRefreshToken() => _storage.read(key: 'refresh_token');

  @override
  Future<void> save(Auth auth) async {
    await _storage.write(key: 'access_token', value: auth.accessToken);
    await _storage.write(key: 'refresh_token', value: auth.refreshToken);
  }
}
