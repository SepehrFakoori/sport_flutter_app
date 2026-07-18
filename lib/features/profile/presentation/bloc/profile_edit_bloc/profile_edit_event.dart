import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/patch_profile.dart';

sealed class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object?> get props => [];
}

class ProfileChanged extends ProfileEditEvent {
  final PatchProfile profile;

  const ProfileChanged(this.profile);

  @override
  List<Object?> get props => [profile];
}
