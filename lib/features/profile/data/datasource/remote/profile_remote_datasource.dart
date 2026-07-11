import 'dart:io';

import 'package:sport_flutter_app/features/profile/data/model/profile_model.dart';
import 'package:sport_flutter_app/features/profile/data/model/update_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> updateProfile(UpdateProfileModel profile);

  Future<String> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  });
}
