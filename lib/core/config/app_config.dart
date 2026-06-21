import 'package:flutter/services.dart';

enum AppEnvironment { develop, stage, production }

class AppConfig {
  final String baseUrl;
  final AppEnvironment environment;

  const AppConfig({required this.baseUrl, required this.environment});

  static AppConfig fromFlavor() {
    switch (appFlavor) {
      case 'development':
        return const AppConfig(
          baseUrl: 'http://192.168.1.110:8000',
          environment: .develop,
        );

      case 'staging':
        return const AppConfig(baseUrl: 'baseUrl', environment: .stage);

      case 'production':
        return const AppConfig(baseUrl: 'baseUrl', environment: .production);

      default:
        return const AppConfig(baseUrl: 'baseUrl', environment: .develop);
    }
  }
}
