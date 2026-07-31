import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

enum PaginatedStatus { initial, loading, loadingMore, success, failure }

class ClassListState extends Equatable {
  final PaginatedStatus status;
  final List<Class> classes;
  final int currentPage;
  final bool hasReachedMax;
  final Failure? failure;

  const ClassListState({
    this.status = PaginatedStatus.initial,
    this.classes = const [],
    this.currentPage = 0,
    this.hasReachedMax = false,
    this.failure,
  });

  ClassListState copyWith({
    PaginatedStatus? status,
    List<Class>? classes,
    int? currentPage,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return ClassListState(
      status: status ?? this.status,
      classes: classes ?? this.classes,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [
    status,
    classes,
    currentPage,
    hasReachedMax,
    failure,
  ];
}
