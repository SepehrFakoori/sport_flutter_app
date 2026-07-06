import 'dart:io';

import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/services/file_upload_service.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/model/profile_model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final HttpClient _client;
  final FileUploadService _fileUploadService;

  const ProfileRemoteDataSourceImpl(this._client, this._fileUploadService);

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

  @override
  Future<String> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  }) async {
    final String photoUrl = await _fileUploadService.uploadFile(
      file: file,
      label: 'user',
      onProgress: onProgress,
    );
    await _client.patch('/users/me/', data: {'profile_photo_id': photoUrl});
    // 1. Ask backend for presigned URL (category: "profile_photo")
    // 2. PUT file directly to S3 with progress callback
    // 3. Confirm upload with backend, get back the permanent file URL
    return photoUrl;
  }
}
