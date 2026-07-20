import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:sport_flutter_app/core/storage/device_id/device_id_storage.dart';

class DeviceIdStorageImpl implements DeviceIdStorage {
  final FlutterSecureStorage _storage;
  final Uuid _uuid;

  const DeviceIdStorageImpl(this._storage, {Uuid uuid = const Uuid()})
    : _uuid = uuid;

  static const String _key = 'device_id';

  @override
  Future<String> getOrCreateDeviceId() async {
    final existing = await _storage.read(key: _key);
    if (existing != null && existing.isNotEmpty) return existing;

    final newId = _uuid.v4();
    await _storage.write(key: _key, value: newId);
    return newId;
  }
}
