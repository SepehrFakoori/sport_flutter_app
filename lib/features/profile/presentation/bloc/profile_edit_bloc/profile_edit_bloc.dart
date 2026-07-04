import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/update_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UpdateProfileUseCase updateProfile;

  ProfileEditBloc(this.updateProfile) : super(const ProfileEditState()) {
    on<ValueChanged>(_onValueChanged);
  }

  Future<void> _onValueChanged(
    ValueChanged event,
    Emitter<ProfileEditState> emit,
  ) async {
    try {
      emit(ProfileEditState(status: .loading));
      // final Profile profile = await updateProfile.call(event.value);
      // emit(ProfileEditState(status: .success, value: profile));
    } on AppException catch (e) {
      emit(ProfileEditState(status: .failure, isValid: false, exception: e));
    }
  }
}
