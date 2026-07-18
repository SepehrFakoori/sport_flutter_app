import 'dart:io';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';
import 'package:sport_flutter_app/core/utils/result.dart';

class ProfileImageCropperUseCase {
  final ImageCropperService _service;

  const ProfileImageCropperUseCase(this._service);

  Future<Result<File>> call({
    required String sourcePath,
    required CropTheme theme,
  }) async {
    final cropped = await _service.crop(sourcePath: sourcePath, theme: theme);

    if (cropped == null) {
      return const Error(ServerFailure());
    }
    return Success(cropped);
  }
}
