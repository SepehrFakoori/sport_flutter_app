import 'package:geolocator/geolocator.dart';
import 'package:sport_flutter_app/core/services/media_permission_service.dart';

class LocationPermissionService {
  Future<AppPermissionStatus> checkLocationPermission() async {
    final status = await Geolocator.checkPermission();
    return _mapStatus(status);
  }

  Future<AppPermissionStatus> requestLocationPermission() async {
    final status = await Geolocator.requestPermission();
    return _mapStatus(status);
  }

  Future<bool> openSettings() => Geolocator.openAppSettings();

  AppPermissionStatus _mapStatus(LocationPermission status) {
    switch (status) {
      case .always || .whileInUse:
        return .granted;

      case .denied:
        return .denied;

      case .deniedForever:
        return .permanentlyDenied;

      case .unableToDetermine:
        return .restricted;
    }
  }
}
