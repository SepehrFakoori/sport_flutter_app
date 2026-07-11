import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<Profile> call(UpdateProfile profile) =>
      _repository.updateProfile(profile);
}
