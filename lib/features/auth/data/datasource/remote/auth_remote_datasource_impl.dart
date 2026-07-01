import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final HttpClient _client;

  const AuthRemoteDatasourceImpl(this._client);

  @override
  Future<void> sendOtp(String phone) async {
    await _client.post('/send-otp', data: {'phone_number': phone});
  }

  @override
  Future<AuthModel> verifyOtp(String phone, String code) async {
    final response = await _client.post(
      '/verify-otp',
      data: {'phone_number': phone, 'code': code},
    );

    return AuthModel.fromJson(response.data);
  }
}
