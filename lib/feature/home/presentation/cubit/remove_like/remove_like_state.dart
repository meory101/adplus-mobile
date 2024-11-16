part of 'remove_like_cubit.dart';

/// Eng.Nour Othman(meory)*


class RemoveLikeState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const RemoveLikeState(
      {required this.error, required this.status, required this.entity});

  factory RemoveLikeState.initial() {
    return const RemoveLikeState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  RemoveLikeState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return RemoveLikeState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
