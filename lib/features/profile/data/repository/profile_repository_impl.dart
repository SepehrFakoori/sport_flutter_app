import 'dart:io';

import 'package:sport_flutter_app/core/error/repository_handler.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/patch_profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/update_profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/model/profile_model.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/patch_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl
    with RepositoryHandler
    implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  const ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<Profile>> getProfile() async {
    return execute(() async {
      final ProfileModel profile = await remoteDataSource.getProfile();

      return profile.toEntity();
    });
  }

  @override
  Future<Result<Profile>> updateProfile(UpdateProfile profile) async {
    return execute(() async {
      final ProfileModel model = await remoteDataSource.updateProfile(
        profile.toModel(),
      );

      return model.toEntity();
    });
  }

  @override
  Future<Result<Profile>> patchProfile(PatchProfile profile) async {
    return execute(() async {
      final ProfileModel model = await remoteDataSource.patchProfile(
        profile.toModel(),
      );

      return model.toEntity();
    });
  }

  @override
  Future<Result<String>> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  }) async {
    return execute(() async {
      final String url = await remoteDataSource.uploadProfilePhoto(
        file: file,
        onProgress: onProgress,
      );

      return url;
    });
  }
}
