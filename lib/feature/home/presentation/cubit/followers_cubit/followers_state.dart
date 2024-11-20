part of 'followers_cubit.dart';

/// Eng.Nour Othman(meory)*


class FollowersState extends Equatable {
  final String error;
  final CubitStatus status;
  final FollowersResponseEntity entity;

  const FollowersState(
      {required this.error, required this.status, required this.entity});

  factory FollowersState.initial() {
    return FollowersState(
        entity: FollowersResponseEntity(),
        error:'',
        status: CubitStatus.initial);
  }

  FollowersState copyWith({
    String? error,
    CubitStatus? status,
    FollowersResponseEntity? entity,
  }) {
    return FollowersState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
