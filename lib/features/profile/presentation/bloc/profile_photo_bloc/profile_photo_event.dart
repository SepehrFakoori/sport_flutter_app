import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';

class ProfilePhotoEvent extends Equatable {
  const ProfilePhotoEvent();

  @override
  List<Object?> get props => [];
}

class ProfileImageGalleryRequested extends ProfilePhotoEvent {
  final CropTheme theme;

  const ProfileImageGalleryRequested({required this.theme});
}

class ProfileImageCameraRequested extends ProfilePhotoEvent {
  final CropTheme theme;

  const ProfileImageCameraRequested({required this.theme});
}

class ProfileCropImageRequested extends ProfilePhotoEvent {
  final File file;
  final CropTheme theme;

  const ProfileCropImageRequested({required this.file, required this.theme});

  @override
  List<Object?> get props => [file];
}

class ProfileUploadRequested extends ProfilePhotoEvent {
  final File file;

  const ProfileUploadRequested({required this.file});

  @override
  List<Object?> get props => [file];
}
