import 'package:app_links/app_links.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_flutter_app/core/config/app_base_url.dart';
import 'package:sport_flutter_app/core/deep_link/deep_link_builder.dart';
import 'package:sport_flutter_app/core/deep_link/deep_link_route_registry.dart';
import 'package:sport_flutter_app/core/deep_link/deep_link_service.dart';
import 'package:sport_flutter_app/core/deep_link/parser/deep_link_parser.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/router/app_router.dart';
import 'package:sport_flutter_app/core/services/app_info/app_info_service.dart';
import 'package:sport_flutter_app/core/services/app_info/app_info_service_impl.dart';
import 'package:sport_flutter_app/core/services/device_info/device_info_service.dart';
import 'package:sport_flutter_app/core/services/device_info/device_info_service_impl.dart';
import 'package:sport_flutter_app/core/services/file_upload_service.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';
import 'package:sport_flutter_app/core/services/image_picker_service.dart';
import 'package:sport_flutter_app/core/services/location_permission_service.dart';
import 'package:sport_flutter_app/core/services/media_permission_service.dart';

void registerServiceModule() {
  sl.registerLazySingleton(() => MediaPermissionService());
  sl.registerLazySingleton(() => LocationPermissionService());
  sl.registerLazySingleton(() => const DeepLinkRouteRegistry({}));
  sl.registerLazySingleton(
    () => DeepLinkParser(
      expectedHost: AppBaseUrl.baseUrl,
      expectedCustomScheme: 'sportappdev',
      routeRegistry: sl<DeepLinkRouteRegistry>(),
    ),
  );
  sl.registerLazySingleton(() => DeepLinkBuilder(host: 'my-domain.ir'));
  sl.registerLazySingleton<AppLinks>(() => AppLinks());
  sl.registerLazySingleton(
    () => DeepLinkService(
      appLinks: sl<AppLinks>(),
      router: routerConfig,
      parser: sl<DeepLinkParser>(),
      onRejected: (reason, uri) {},
    ),
  );
  sl.registerLazySingleton<AppInfoService>(() => AppInfoServiceImpl());
  sl.registerLazySingleton<DeviceInfoService>(
    () => DeviceInfoServiceImpl(DeviceInfoPlugin()),
  );
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => FileUploadService(sl<HttpClient>(), Dio()));
  sl.registerLazySingleton(
    () => ImagePickerService(sl<ImagePicker>(), sl<MediaPermissionService>()),
  );
  sl.registerLazySingleton(() => ImageCropperService());
}
