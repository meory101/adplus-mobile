part of 'favorites_cubit.dart';

/// Eng.Nour Othman(meory)*


class FavoritesState extends Equatable {
  final String error;
  final CubitStatus status;
  final FavoritesResponseEntity entity;

  const FavoritesState(
      {required this.error, required this.status, required this.entity});

  factory FavoritesState.initial() {
    return FavoritesState(
        entity: FavoritesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  FavoritesState copyWith({
    String? error,
    CubitStatus? status,
    FavoritesResponseEntity? entity,
  }) {
    return FavoritesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
