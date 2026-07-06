import 'package:permission_handler/permission_handler.dart';

enum AppPermissionStatus { granted, denied, permanentlyDenied, restricted }

class PermissionService {
  Future<AppPermissionStatus> checkGalleryPermission() async {
    final status = await Permission.photos.status;

    return _mapStatus(status);
  }

  Future<AppPermissionStatus> requestGalleryPermission() async {
    final status = await Permission.photos.request();
    return _mapStatus(status);
  }

  Future<AppPermissionStatus> checkCameraPermission() async {
    final status = await Permission.camera.status;
    return _mapStatus(status);
  }

  Future<AppPermissionStatus> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return _mapStatus(status);
  }

  Future<bool> openSettings() => openAppSettings();

  AppPermissionStatus _mapStatus(PermissionStatus status) {
    if (status.isGranted || status.isLimited) return .granted;
    if (status.isPermanentlyDenied) return .permanentlyDenied;
    if (status.isRestricted) return .restricted;
    return .denied;
  }
}
