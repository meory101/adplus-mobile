part of 'get_category_attributes_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetCategoryAttributesState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCategoriesResponseEntity entity;

  const GetCategoryAttributesState(
      {required this.error, required this.status, required this.entity});

  factory GetCategoryAttributesState.initial() {
    return GetCategoryAttributesState(
        entity: GetCategoriesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCategoryAttributesState copyWith({
    String? error,
    CubitStatus? status,
    GetCategoriesResponseEntity? entity,
  }) {
    return GetCategoryAttributesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
