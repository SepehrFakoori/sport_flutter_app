import 'dart:io';

import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/services/image_picker_service.dart';
import 'package:sport_flutter_app/core/utils/result.dart';

enum ImagePickSource { gallery, camera }

class PickProfilePhotoUseCase {
  final ImagePickerService _service;

  const PickProfilePhotoUseCase(this._service);

  Future<Result<File>> call({required ImagePickSource source}) async {
    final file = source == .gallery
        ? await _service.pickFromGallery()
        : await _service.pickFromCamera();

    if (file == null) {
      return const Error(ServerFailure());
    }

    return Success(file);
  }
}
