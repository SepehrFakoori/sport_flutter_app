import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/mapper/profile_mapper.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  const ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Profile> getProfile() async {
    final response = await remoteDataSource.getProfile();
    return response.toEntity();
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    final response = await remoteDataSource.updateProfile(profile.toModel());
    return response.toEntity();
  }
}
