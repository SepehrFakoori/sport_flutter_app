import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

enum PaginatedStatus { initial, loading, loadingMore, success, failure }

class LocationListState extends Equatable {
  final PaginatedStatus status;
  final List<Location> cities;
  final int currentPage;
  final bool hasReachedMax;
  final String? searchValue;
  final String? errorMessage;

  const LocationListState({
    this.status = PaginatedStatus.initial,
    this.cities = const [],
    this.currentPage = 0,
    this.hasReachedMax = false,
    this.searchValue,
    this.errorMessage,
  });

  LocationListState copyWith({
    PaginatedStatus? status,
    List<Location>? cities,
    int? currentPage,
    bool? hasReachedMax,
    String? searchValue,
    String? errorMessage,
  }) {
    return LocationListState(
      status: status ?? this.status,
      cities: cities ?? this.cities,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      searchValue: searchValue ?? this.searchValue,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    cities,
    currentPage,
    hasReachedMax,
    searchValue,
    errorMessage,
  ];
}
