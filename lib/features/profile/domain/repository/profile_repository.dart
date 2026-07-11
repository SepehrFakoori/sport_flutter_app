import 'dart:io';

import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();

  Future<Profile> updateProfile(UpdateProfile profile);

  Future<String> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  });
}
