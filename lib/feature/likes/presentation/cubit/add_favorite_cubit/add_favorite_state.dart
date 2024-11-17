part of 'add_favorite_cubit.dart';

/// Eng.Nour Othman(meory)*


class AddFavoriteState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const AddFavoriteState(
      {required this.error, required this.status, required this.entity});

  factory AddFavoriteState.initial() {
    return AddFavoriteState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  AddFavoriteState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return AddFavoriteState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
