import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/core/services/file_upload_service.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:sport_flutter_app/features/profile/data/datasource/remote/profile_remote_datasource_impl.dart';
import 'package:sport_flutter_app/features/profile/data/repository/profile_repository_impl.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/complete_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/get_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/domain/use_case/update_profile_usecase.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_bloc.dart';

void registerProfileModule() {
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () =>
        ProfileRemoteDataSourceImpl(sl<HttpClient>(), sl<FileUploadService>()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetProfileUseCase(sl<ProfileRepository>()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl<ProfileRepository>()));
  sl.registerLazySingleton(
    () => CompleteProfileUseCase(sl<ProfileRepository>()),
  );

  sl.registerFactory(() => ProfileBloc(sl<GetProfileUseCase>()));
  sl.registerFactory(() => ProfileEditBloc(sl<UpdateProfileUseCase>()));
  sl.registerFactory(() => CompleteProfileBloc(sl<CompleteProfileUseCase>()));
}
