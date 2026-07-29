import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/features/location/data/datasource/location_remote_datasource.dart';
import 'package:sport_flutter_app/features/location/data/datasource/location_remote_datasource_impl.dart';
import 'package:sport_flutter_app/features/location/data/repository/location_repository_impl.dart';
import 'package:sport_flutter_app/features/location/domain/repository/location_repository.dart';
import 'package:sport_flutter_app/features/location/domain/use_case/get_location_usecase.dart';
import 'package:sport_flutter_app/features/location/domain/use_case/get_locations_usecase.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_bloc.dart';

void registerLocationModule() {
  sl.registerLazySingleton<LocationRemoteDatasource>(
    () => LocationRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(sl<LocationRemoteDatasource>()),
  );

  sl.registerLazySingleton(() => GetLocationUseCase(sl<LocationRepository>()));
  sl.registerLazySingleton(() => GetLocationsUseCase(sl<LocationRepository>()));

  sl.registerFactory(() => LocationListBloc(sl<GetLocationsUseCase>()));
}
