import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/complete_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_state.dart';

class CompleteProfileBloc
    extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  final CompleteProfileUseCase completeProfile;

  CompleteProfileBloc(this.completeProfile)
    : super(const CompleteProfileState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<GenderChanged>(_onGenderChanged);
    on<EmailChanged>(_onEmailChanged);
    on<BirthDateChanged>(_onBirthDateChanged);
    on<SubmitProfile>(_onSubmitProfile);
  }

  Future<void> _onFirstNameChanged(
    FirstNameChanged event,
    Emitter<CompleteProfileState> emit,
  ) async {
    try {
      completeProfile.validateFirstName(event.firstName);
      emit(state.copyWith(firstName: event.firstName, isFirstNameValid: true));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          firstName: event.firstName,
          isFirstNameValid: false,
          exception: e,
        ),
      );
    }
  }

  Future<void> _onLastNameChanged(
    LastNameChanged event,
    Emitter<CompleteProfileState> emit,
  ) async {
    try {
      completeProfile.validateLastName(event.lastName);
      emit(state.copyWith(lastName: event.lastName, isLastNameValid: true));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          lastName: event.lastName,
          isLastNameValid: false,
          exception: e,
        ),
      );
    }
  }

  Future<void> _onGenderChanged(
    GenderChanged event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(gender: event.gender, isLastNameValid: true));
  }

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<CompleteProfileState> emit,
  ) async {
    try {
      completeProfile.validateEmail(event.email);
      emit(state.copyWith(email: event.email, isEmailValid: true));
    } on AppException catch (e) {
      emit(
        state.copyWith(email: event.email, isEmailValid: false, exception: e),
      );
    }
  }

  Future<void> _onBirthDateChanged(
    BirthDateChanged event,
    Emitter<CompleteProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(birthDate: event.birthDate, isBirthDateValid: true));
    } on AppException catch (e) {
      emit(
        state.copyWith(
          birthDate: event.birthDate,
          isBirthDateValid: false,
          exception: e,
        ),
      );
    }
  }

  Future<void> _onSubmitProfile(
    SubmitProfile event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(status: .loading));
    try {
      final UpdateProfile profile = UpdateProfile(
        firstName: state.firstName,
        lastName: state.lastName,
        gender: state.gender,
        email: state.email,
        birthDate: state.birthDate!,
      );
      await completeProfile.call(profile);
      emit(state.copyWith(status: .success));
    } on AppException catch (e) {
      emit(state.copyWith(status: .failure, exception: e));
    }
  }
}
