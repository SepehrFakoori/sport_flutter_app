import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/services/app_info/app_info_service.dart';
import 'package:sport_flutter_app/core/services/device_info/device_info_service.dart';
import 'package:sport_flutter_app/core/storage/device_id/device_id_storage.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final HttpClient _client;
  final DeviceInfoService _deviceInfoService;
  final AppInfoService _appInfoService;
  final DeviceIdStorage _deviceIdStorage;

  const AuthRemoteDatasourceImpl(
    this._client,
    this._deviceInfoService,
    this._appInfoService,
    this._deviceIdStorage,
  );

  @override
  Future<void> sendOtp(String phone) async {
    await _client.post('/send-otp', data: {'phone_number': phone});
  }

  @override
  Future<AuthModel> verifyOtp(String phone, String code) async {
    final device = await _deviceInfoService.getDeviceInfo();
    final app = await _appInfoService.getAppInfo();
    final deviceId = await _deviceIdStorage.getOrCreateDeviceId();

    final response = await _client.post(
      '/verify-otp',
      data: {
        'phone_number': phone,
        'code': code,
        'device': {
          'device_id': deviceId,
          'platform': device.platform,
          'app_version': app.fullVersion,
          'os_version': device.osVersion,
          'device_model': device.model,
          'device_name': device.name,
        },
      },
    );

    return AuthModel.fromJson(response.data);
  }

  @override
  Future<void> logout(String refreshToken) async {
    await _client.post('/logout', data: {'refresh': refreshToken});
  }
}
