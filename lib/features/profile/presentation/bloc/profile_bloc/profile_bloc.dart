import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/get_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfile;

  ProfileBloc(this.getProfile) : super(const InitState()) {
    on<GetProfile>(_onGetProfile);
  }

  Future<void> _onGetProfile(
    GetProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const LoadingState());
      final Profile profile = await getProfile.call();
      emit(SuccessState(profile));
    } on AppException {
      emit(FailureState());
    }
  }
}
