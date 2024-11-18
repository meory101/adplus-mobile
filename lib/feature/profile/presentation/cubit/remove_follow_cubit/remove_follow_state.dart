part of 'remove_follow_cubit.dart';

/// Eng.Nour Othman(meory)*


class RemoveFollowState extends Equatable {
  final String error;
  final CubitStatus status;
  final RemoveFollowResponseEntity entity;

  const RemoveFollowState(
      {required this.error, required this.status, required this.entity});

  factory RemoveFollowState.initial() {
    return RemoveFollowState(
        entity: RemoveFollowResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  RemoveFollowState copyWith({
    String? error,
    CubitStatus? status,
    RemoveFollowResponseEntity? entity,
  }) {
    return RemoveFollowState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
