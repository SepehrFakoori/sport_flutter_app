import 'dart:io';

import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';

abstract class ProfileRepository {
  Future<Result<Profile>> getProfile();

  Future<Result<Profile>> updateProfile(UpdateProfile profile);

  Future<Result<String>> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  });
}
