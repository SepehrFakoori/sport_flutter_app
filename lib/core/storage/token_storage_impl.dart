import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_flutter_app/core/storage/token_storage.dart';

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
  Future<void> saveAccessToken(String token) async =>
      await _storage.write(key: 'access_token', value: token);

  @override
  Future<void> saveRefreshToken(String token) async =>
      await _storage.write(key: 'refresh_token', value: token);
}
