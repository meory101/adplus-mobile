part of 'likes_cubit.dart';

/// Eng.Nour Othman(meory)*


class LikesState extends Equatable {
  final String error;
  final CubitStatus status;
  final LikesResponseEntity entity;
  final bool isReachedMax;

  const LikesState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory LikesState.initial() {
    return LikesState(
      isReachedMax: false,
        entity: LikesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  LikesState copyWith({
    String? error,
    CubitStatus? status,
    LikesResponseEntity? entity,
    bool? isReachedMax
  }) {
    return LikesState(
        error: error ?? this.error,
        status: status ?? this.status,
        isReachedMax: isReachedMax?? this.isReachedMax,

        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
