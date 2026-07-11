import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';

sealed class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object?> get props => [];
}

class ValueChanged extends ProfileEditEvent {
  final Profile profile;

  const ValueChanged(this.profile);

  @override
  List<Object?> get props => [profile];
}
