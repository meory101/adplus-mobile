part of 'category_inside_page_cubit.dart';

/// Eng.Nour Othman(meory)*


class CategoryInsidePageState extends Equatable {
  final String error;
  final CubitStatus status;
  final CategoryInsidePageResponseEntity entity;

  const CategoryInsidePageState(
      {required this.error, required this.status, required this.entity});

  factory CategoryInsidePageState.initial() {
    return CategoryInsidePageState(
        entity: CategoryInsidePageResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CategoryInsidePageState copyWith({
    String? error,
    CubitStatus? status,
    CategoryInsidePageResponseEntity? entity,
  }) {
    return CategoryInsidePageState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
