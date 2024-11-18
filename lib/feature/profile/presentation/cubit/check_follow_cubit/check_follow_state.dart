part of 'check_follow_cubit.dart';

/// Eng.Nour Othman(meory)*


class CheckFollowState extends Equatable {
  final String error;
  final CubitStatus status;
  final CheckFollowResponseEntity entity;

  const CheckFollowState(
      {required this.error, required this.status, required this.entity});

  factory CheckFollowState.initial() {
    return CheckFollowState(
        entity: CheckFollowResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CheckFollowState copyWith({
    String? error,
    CubitStatus? status,
    CheckFollowResponseEntity? entity,
  }) {
    return CheckFollowState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
