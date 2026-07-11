import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class InitState extends ProfileState {
  const InitState();
}

class LoadingState extends ProfileState {
  const LoadingState();
}

class SuccessState extends ProfileState {
  final Profile profile;

  const SuccessState(this.profile);
}

class FailureState extends ProfileState {}
