import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sport_flutter_app/core/storage/token/token_storage.dart';

class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage _storage;

  const TokenStorageImpl(this._storage);

  static const String _accessKey = 'access_token';
  static const String _refreshKey = 'refresh_token';

  @override
  Future<void> clear() => Future.wait([
    _storage.delete(key: _accessKey),
    _storage.delete(key: _refreshKey),
  ]); //_storage.deleteAll();

  @override
  Future<String?> getAccessToken() => _storage.read(key: _accessKey);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _refreshKey);

  @override
  Future<void> saveAccessToken(String token) async =>
      await _storage.write(key: _accessKey, value: token);

  @override
  Future<void> saveRefreshToken(String token) async =>
      await _storage.write(key: _refreshKey, value: token);
}
