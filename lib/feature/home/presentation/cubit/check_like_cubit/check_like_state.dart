part of 'check_like_cubit.dart';

/// Eng.Nour Othman(meory)*


class CheckLikeState extends Equatable {
  final String error;
  final CubitStatus status;
  final CheckLikeResponseEntity entity;

  const CheckLikeState(
      {required this.error, required this.status, required this.entity});

  factory CheckLikeState.initial() {
    return CheckLikeState(
        entity: CheckLikeResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CheckLikeState copyWith({
    String? error,
    CubitStatus? status,
    CheckLikeResponseEntity? entity,
  }) {
    return CheckLikeState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
