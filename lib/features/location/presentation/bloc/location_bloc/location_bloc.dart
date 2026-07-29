import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/location/domain/use_case/get_location_usecase.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_bloc/location_event.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase getCity;

  LocationBloc(this.getCity) : super(const InitState()) {
    on<GetCity>(_onGetCity);
  }

  Future<void> _onGetCity(GetCity event, Emitter<LocationState> emit) async {
    emit(const LoadingState());

    final result = await getCity.call(event.city);

    result.when(
      success: (cityItem) => emit(SuccessState(cityItem)),
      error: (failure) => emit(FailureState()),
    );
  }
}
