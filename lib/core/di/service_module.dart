import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/services/file_upload_service.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';
import 'package:sport_flutter_app/core/services/image_picker_service.dart';
import 'package:sport_flutter_app/core/services/permission_service.dart';

void registerServiceModule() {
  sl.registerLazySingleton(() => PermissionService());
  sl.registerLazySingleton(() => ImagePicker());
  sl.registerLazySingleton(() => FileUploadService(sl<HttpClient>(), Dio()));
  sl.registerLazySingleton(
    () => ImagePickerService(sl<ImagePicker>(), sl<PermissionService>()),
  );
  sl.registerLazySingleton(() => ImageCropperService());
}
