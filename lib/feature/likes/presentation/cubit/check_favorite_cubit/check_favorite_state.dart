part of 'check_favorite_cubit.dart';

/// Eng.Nour Othman(meory)*


class CheckFavoriteState extends Equatable {
  final String error;
  final CubitStatus status;
  final CheckFavoriteResponseEntity entity;

  const CheckFavoriteState(
      {required this.error, required this.status, required this.entity});

  factory CheckFavoriteState.initial() {
    return CheckFavoriteState(
        entity: CheckFavoriteResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CheckFavoriteState copyWith({
    String? error,
    CubitStatus? status,
    CheckFavoriteResponseEntity? entity,
  }) {
    return CheckFavoriteState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
