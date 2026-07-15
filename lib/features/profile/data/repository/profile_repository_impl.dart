import 'dart:io';

import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/update_profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  const ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<Profile>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Success(response.toEntity());
    } catch (e) {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Profile>> updateProfile(UpdateProfile profile) async {
    try {
      final response = await remoteDataSource.updateProfile(profile.toModel());
      return Success(response.toEntity());
    } catch (e) {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<String>> uploadProfilePhoto({
    required File file,
    required void Function(double progress) onProgress,
  }) async {
    try {
      final url = await remoteDataSource.uploadProfilePhoto(
        file: file,
        onProgress: onProgress,
      );

      return Success(url);
    } catch (e) {
      return Error(ServerFailure());
    }
  }
}
