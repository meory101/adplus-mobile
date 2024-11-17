part of 'likes_cubit.dart';

/// Eng.Nour Othman(meory)*


class LikesState extends Equatable {
  final String error;
  final CubitStatus status;
  final LikesResponseEntity entity;

  const LikesState(
      {required this.error, required this.status, required this.entity});

  factory LikesState.initial() {
    return LikesState(
        entity: LikesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  LikesState copyWith({
    String? error,
    CubitStatus? status,
    LikesResponseEntity? entity,
  }) {
    return LikesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
