import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/pick_profile_photo_usecase.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/profile_image_cropper_usecase.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/upload_profile_photo_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_state.dart';

class ProfilePhotoBloc extends Bloc<ProfilePhotoEvent, ProfilePhotoState> {
  final PickProfilePhotoUseCase pickProfilePhoto;
  final ProfileImageCropperUseCase imageCropper;
  final UploadProfilePhotoUseCase uploadProfilePhoto;

  ProfilePhotoBloc(
    this.pickProfilePhoto,
    this.imageCropper,
    this.uploadProfilePhoto,
  ) : super(const ProfilePhotoState()) {
    on<ProfileImageGalleryRequested>(_onGalleryRequested);
    on<ProfileImageCameraRequested>(_onCameraRequested);
    on<ProfileCropImageRequested>(_onCropImageRequested);
    on<ProfileUploadRequested>(_onUploadRequested);
  }

  Future<void> _onGalleryRequested(
    ProfileImageGalleryRequested event,
    Emitter<ProfilePhotoState> emit,
  ) async {
    final result = await pickProfilePhoto.call(source: .gallery);

    await result.when(
      success: (file) async {
        emit(state.copyWith(pickedFile: file, status: .success));
        add(ProfileCropImageRequested(file: file, theme: event.theme));
      },
      error: (failure) async =>
          emit(state.copyWith(status: .failure, failure: failure)),
    );
  }

  Future<void> _onCameraRequested(
    ProfileImageCameraRequested event,
    Emitter<ProfilePhotoState> emit,
  ) async {
    final result = await pickProfilePhoto.call(source: .camera);

    await result.when(
      success: (file) async {
        emit(state.copyWith(pickedFile: file, status: .idle));
        add(ProfileCropImageRequested(file: file, theme: event.theme));
      },
      error: (failure) async =>
          emit(state.copyWith(status: .failure, failure: failure)),
    );
  }

  Future<void> _onCropImageRequested(
    ProfileCropImageRequested event,
    Emitter<ProfilePhotoState> emit,
  ) async {
    final result = await imageCropper.call(
      sourcePath: event.file.path,
      theme: event.theme,
    );

    await result.when(
      success: (file) {
        emit(state.copyWith(pickedFile: file));
        add(ProfileUploadRequested(file: file));
      },
      error: (failure) {
        emit(state.copyWith(failure: failure));
      },
    );
  }

  Future<void> _onUploadRequested(
    ProfileUploadRequested event,
    Emitter<ProfilePhotoState> emit,
  ) async {
    emit(state.copyWith(status: .loading, uploadProgress: 0.0));

    final result = await uploadProfilePhoto.call(
      file: event.file,
      onProgress: (progress) {
        emit(state.copyWith(uploadProgress: progress));
      },
    );

    result.when(
      success: (_) =>
          emit(state.copyWith(status: .success, uploadProgress: 1.0)),
      error: (failure) =>
          emit(state.copyWith(status: .failure, failure: failure)),
    );
  }
}
