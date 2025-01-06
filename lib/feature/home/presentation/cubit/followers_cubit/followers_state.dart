part of 'followers_cubit.dart';

/// Eng.Nour Othman(meory)*


class FollowersState extends Equatable {
  final String error;
  final CubitStatus status;
  final FollowersResponseEntity entity;
  final bool? isReachedMax;

  const FollowersState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory FollowersState.initial() {
    return FollowersState(
      isReachedMax: false,
        entity: FollowersResponseEntity(),
        error:'',
        status: CubitStatus.initial);
  }

  FollowersState copyWith({
    String? error,
    CubitStatus? status,
    FollowersResponseEntity? entity,
    bool? isReachedMax
  }) {
    return FollowersState(
      isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
