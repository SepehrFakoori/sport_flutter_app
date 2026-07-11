import 'package:sport_flutter_app/features/profile/data/mapper/gender_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/model/update_profile_model.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';

extension UpdateProfileMapper on UpdateProfile {
  UpdateProfileModel toModel() {
    return UpdateProfileModel(
      firstName: firstName,
      lastName: lastName,
      gender: GenderMapper.toApi(gender),
      email: email,
      birthDate: birthDate,
    );
  }
}
