import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/extension/result_extensions.dart';
import 'package:sport_flutter_app/features/location/domain/use_case/get_locations_usecase.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_event.dart';
import 'package:sport_flutter_app/features/location/presentation/bloc/location_list_bloc/location_list_state.dart';

class LocationListBloc extends Bloc<LocationListEvent, LocationListState> {
  final GetLocationsUseCase getCities;

  LocationListBloc(this.getCities) : super(const LocationListState()) {
    on<CitiesFetchRequested>(_onFetchRequested);
    on<CitiesRefreshRequested>(_onRefreshRequested);
    on<CitiesSearchRequested>(_onSearchRequested);
  }

  Future<void> _onFetchRequested(
    CitiesFetchRequested event,
    Emitter<LocationListState> emit,
  ) async {
    if (state.hasReachedMax) return;
    final isFirstPage = state.currentPage == 0;
    emit(state.copyWith(status: isFirstPage ? .loading : .loadingMore));

    final result = await getCities.call(page: state.currentPage + 1);

    result.when(
      success: (data) {
        final items = [...state.cities, ...data.items];

        emit(
          state.copyWith(
            status: .success,
            cities: items,
            currentPage: data.currentPage,
            hasReachedMax: !data.hasMore,
          ),
        );
      },
      error: (failure) =>
          emit(state.copyWith(status: .failure, errorMessage: failure.message)),
    );
  }

  Future<void> _onRefreshRequested(
    CitiesRefreshRequested event,
    Emitter<LocationListState> emit,
  ) async {
    emit(const LocationListState());
    add(CitiesFetchRequested());
  }

  Future<void> _onSearchRequested(
    CitiesSearchRequested event,
    Emitter<LocationListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: .loading,
        cities: [],
        currentPage: 0,
        hasReachedMax: false,
        searchValue: event.value,
      ),
    );

    final result = await getCities(page: 1, value: event.value);

    result.when(
      success: (data) {
        emit(
          state.copyWith(
            status: .success,
            cities: data.items,
            currentPage: data.currentPage,
            hasReachedMax: !data.hasMore,
          ),
        );
      },
      error: (failure) {
        emit(state.copyWith(status: .failure, errorMessage: failure.message));
      },
    );
  }
}
