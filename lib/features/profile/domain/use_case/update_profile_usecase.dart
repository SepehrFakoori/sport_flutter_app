import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<Result<Profile>> call(UpdateProfile profile) =>
      _repository.updateProfile(profile);
}
