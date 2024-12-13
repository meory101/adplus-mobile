part of 'advs_by_category_cubit.dart';

/// Eng.Nour Othman(meory)*


class AdsByCategoryState extends Equatable {
  final String error;
  final CubitStatus status;
  final AdsByCategoryResponseEntity entity;
  final bool isReachedMax;

  const AdsByCategoryState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory AdsByCategoryState.initial() {
    return AdsByCategoryState(
      isReachedMax: false,
        entity: AdsByCategoryResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  AdsByCategoryState copyWith({
    String? error,
    CubitStatus? status,
    AdsByCategoryResponseEntity? entity,
    bool? isReachedMax
  }) {
    return AdsByCategoryState(
      isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
