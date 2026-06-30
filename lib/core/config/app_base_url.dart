import 'package:sport_flutter_app/core/config/flavor_config.dart';

class AppBaseUrl {
  const AppBaseUrl._();

  static String get baseUrl {
    if (isProduction) {
      return 'http://192.168.1.110:8000';
    } else if (isStaging) {
      return 'http://192.168.1.110:8000';
    } else {
      return 'http://192.168.1.110:8000';
    }
  }
}
