import 'package:sport_flutter_app/features/profile/data/mapper/gender_mapper.dart';
import 'package:sport_flutter_app/features/profile/data/model/profile_model.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';

extension ProfileMapper on ProfileModel {
  Profile toEntity() {
    return Profile(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatar: avatar,
      email: email,
      gender: GenderMapper.fromApi(gender),
      birthDate: birthDate,
    );
  }
}

extension ProfileModelMapper on Profile {
  ProfileModel toModel() {
    return ProfileModel(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatar: avatar,
      email: email,
      gender: GenderMapper.toApi(gender),
      birthDate: birthDate,
    );
  }
}
