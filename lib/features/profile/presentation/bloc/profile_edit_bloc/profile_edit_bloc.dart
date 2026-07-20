import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/update_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UpdateProfileUseCase updateProfile;

  ProfileEditBloc(this.updateProfile) : super(const ProfileEditState()) {
    on<ProfileChanged>(_onProfileChanged);
  }

  Future<void> _onProfileChanged(
    ProfileChanged event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(ProfileEditState(status: .loading));

    final result = await updateProfile.call(event.profile);

    result.when(
      success: (Profile profile) => emit(state.copyWith(status: .success)),
      error: (Failure failure) => emit(state.copyWith(status: .failure)),
    );
  }
}
