import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/coach/data/datasource/coach_remote_datasource.dart';
import 'package:sport_flutter_app/features/coach/data/datasource/coach_remote_datasource_impl.dart';
import 'package:sport_flutter_app/features/coach/data/repository/coach_repository_impl.dart';
import 'package:sport_flutter_app/features/coach/domain/repository/coach_repository.dart';
import 'package:sport_flutter_app/features/coach/domain/use_case/get_coach_usecase.dart';
import 'package:sport_flutter_app/features/coach/domain/use_case/get_coaches_usecase.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_bloc.dart';

void registerCoachModule() {
  sl.registerLazySingleton<CoachRemoteDatasource>(
    () => CoachRemoteDatasourceImpl(sl<HttpClient>()),
  );

  sl.registerLazySingleton<CoachRepository>(
    () => CoachRepositoryImpl(sl<CoachRemoteDatasource>()),
  );

  sl.registerLazySingleton(() => GetCoachUseCase(sl<CoachRepository>()));
  sl.registerLazySingleton(() => GetCoachesUseCase(sl<CoachRepository>()));

  sl.registerFactory(() => CoachBloc(sl<GetCoachUseCase>()));
}
