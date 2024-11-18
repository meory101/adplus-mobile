part of 'remove_favorite_cubit.dart';

/// Eng.Nour Othman(meory)*


class RemoveFavoriteState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const RemoveFavoriteState(
      {required this.error, required this.status, required this.entity});

  factory RemoveFavoriteState.initial() {
    return RemoveFavoriteState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  RemoveFavoriteState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return RemoveFavoriteState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
