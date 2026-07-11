import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sport_flutter_app/core/exception/permission_exception.dart';
import 'package:sport_flutter_app/core/services/permission_service.dart';

class ImagePickerService {
  final ImagePicker _picker;
  final PermissionService _permissionService;

  const ImagePickerService(this._picker, this._permissionService);

  Future<File?> pickFromGallery({int imageQuality = 80}) async {
    var status = await _permissionService.checkGalleryPermission();

    if (status == .denied) {
      status = await _permissionService.requestGalleryPermission();
    }

    if (status == AppPermissionStatus.permanentlyDenied) {
      throw PermissionDeniedException(); // isPermanent: true
    }
    if (status != AppPermissionStatus.granted) {
      throw PermissionDeniedException(); // isPermanent: false
    }

    try {
      final XFile? picked = await _picker.pickImage(
        source: .gallery,
        imageQuality: imageQuality,
        maxWidth: 1080,
      );

      if (picked == null) return null;
      return File(picked.path);
    } catch (e) {
      throw ImagePickFailedException();
    }
  }

  Future<File?> pickFromCamera({int imageQuality = 80}) async {
    var status = await _permissionService.checkCameraPermission();

    if (status == AppPermissionStatus.denied) {
      status = await _permissionService.requestCameraPermission();
    }

    if (status == AppPermissionStatus.permanentlyDenied) {
      throw PermissionDeniedException(); // isPermanent: true
    }
    if (status != AppPermissionStatus.granted) {
      throw PermissionDeniedException(); // isPermanent: false
    }

    try {
      final XFile? picked = await _picker.pickImage(
        source: .camera,
        imageQuality: imageQuality,
        maxWidth: 1080,
      );

      if (picked == null) return null;
      return File(picked.path);
    } catch (e) {
      throw ImagePickFailedException();
    }
  }
}
