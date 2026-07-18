import 'package:sport_flutter_app/features/profile/data/mapper/gender_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/model/patch_profile_model.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/patch_profile.dart';

extension PatchProfileMapper on PatchProfile {
  PatchProfileModel toModel() {
    return PatchProfileModel(
      firstName: firstName,
      lastName: lastName,
      gender: gender != null ? GenderMapper.toApi(gender!) : null,
      email: email,
      birthDate: birthDate,
    );
  }
}
