import 'dart:io';

import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();

  Future<Profile> updateProfile(Profile profile);

  Future<String> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  });
}
