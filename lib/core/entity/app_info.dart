class AppInfo {
  final String name;
  final String packageName;
  final String version;
  final String buildNumber;

  const AppInfo({
    required this.name,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  String get fullVersion => '$version+$buildNumber';
}
