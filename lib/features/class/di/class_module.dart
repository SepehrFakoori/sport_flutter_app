import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource_impl.dart';
import 'package:sport_flutter_app/features/class/data/repository/class_repository_impl.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_class_usecase.dart';
import 'package:sport_flutter_app/features/class/domain/user_case/get_classes_usecase.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_bloc.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_list_bloc/class_list_bloc.dart';
import 'package:sport_flutter_app/features/home/presentation/bloc/home_bloc/home_bloc.dart';

void registerClassModule() {
  sl.registerLazySingleton<ClassRemoteDatasource>(
    () => ClassRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<ClassRepository>(
    () => ClassRepositoryImpl(sl<ClassRemoteDatasource>()),
  );

  sl.registerLazySingleton(() => GetClassesUseCase(sl<ClassRepository>()));
  sl.registerLazySingleton(() => GetClassUseCase(sl<ClassRepository>()));

  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => ClassBloc(sl()));
  sl.registerFactory(() => ClassListBloc(sl()));
}
