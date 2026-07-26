import 'package:geolocator/geolocator.dart';
import 'package:sport_flutter_app/core/exception/permission_exception.dart'
    as exception;
import 'package:sport_flutter_app/core/services/location_permission_service.dart';

class LocationService {
  final LocationPermissionService _permissionService;

  const LocationService(this._permissionService);

  Future<Position> determinePosition() async {
    var status = await _permissionService.checkLocationPermission();

    if (status == .denied) {
      status = await _permissionService.requestLocationPermission();
    }

    if (status == .permanentlyDenied) {
      throw PermissionDeniedException(''); // isPermanent: true
    }
    if (status != .granted) {
      throw PermissionDeniedException(''); // isPermanent: false
    }

    try {
      final data = await Geolocator.getCurrentPosition();
      return data;
    } catch (e) {
      throw exception.LocationFailedException();
    }
  }
}
