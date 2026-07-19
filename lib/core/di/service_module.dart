import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_flutter_app/core/config/app_base_url.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/router/app_router.dart';
import 'package:sport_flutter_app/core/services/deep_link_service.dart';
import 'package:sport_flutter_app/core/services/file_upload_service.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';
import 'package:sport_flutter_app/core/services/image_picker_service.dart';
import 'package:sport_flutter_app/core/services/permission_service.dart';

void registerServiceModule() {
  sl.registerLazySingleton(() => PermissionService());
  sl.registerLazySingleton<AppLinks>(() => AppLinks());
  sl.registerLazySingleton<DeepLinkService>(
    () => DeepLinkService(
      sl<AppLinks>(),
      routerConfig,
      expectedHost: AppBaseUrl.baseUrl,
    ),
  );
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => FileUploadService(sl<HttpClient>(), Dio()));
  sl.registerLazySingleton(
    () => ImagePickerService(sl<ImagePicker>(), sl<PermissionService>()),
  );
  sl.registerLazySingleton(() => ImageCropperService());
}
