import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/model/profile_model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HttpClient _client;

  const ProfileRemoteDataSourceImpl(this._client);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _client.get('/users/me/');
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    final response = await _client.put('/users/me/', data: profile.toJson());
    return ProfileModel.fromJson(response.data);
  }
}
