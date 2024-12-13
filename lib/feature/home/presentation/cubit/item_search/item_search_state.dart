part of 'item_search_cubit.dart';

/// Eng.Nour Othman(meory)*

class ItemSearchState extends Equatable {
  final String error;
  final CubitStatus status;
  final ItemSearchResponseEntity entity;
  final bool isReachedMax;

  const ItemSearchState(
      {required this.error,
      required this.status,
      required this.entity,
      required this.isReachedMax});

  factory ItemSearchState.initial() {
    return ItemSearchState(
        isReachedMax: false,
        entity: ItemSearchResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  ItemSearchState copyWith({
    String? error,
    CubitStatus? status,
    ItemSearchResponseEntity? entity,
    bool? isReachedMax,
  }) {
    return ItemSearchState(
        isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
