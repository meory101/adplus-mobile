part of 'get_categories_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetCategoriesState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCategoriesResponseEntity entity;

  const GetCategoriesState(
      {required this.error, required this.status, required this.entity});

  factory GetCategoriesState.initial() {
    return GetCategoriesState(
        entity: GetCategoriesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCategoriesState copyWith({
    String? error,
    CubitStatus? status,
    GetCategoriesResponseEntity? entity,
  }) {
    return GetCategoriesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
