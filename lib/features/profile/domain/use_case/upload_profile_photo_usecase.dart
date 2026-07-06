import 'dart:io';

import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class UploadProfilePhotoUseCase {
  final ProfileRepository _repository;

  const UploadProfilePhotoUseCase(this._repository);

  Future<String> call({
    required File file,
    required void Function(double progress) onProgress,
  }) => _repository.uploadProfilePhoto(file: file, onProgress: onProgress);
}
