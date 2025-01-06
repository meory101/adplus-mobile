part of 'comment_cubit.dart';

/// Eng.Nour Othman(meory)*


class CommentState extends Equatable {
  final String error;
  final CubitStatus status;
  final CommentsResponseEntity entity;
  final bool isReachedMax;

  const CommentState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory CommentState.initial() {
    return CommentState(
      isReachedMax: false,
        entity: CommentsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CommentState copyWith({
    String? error,
    CubitStatus? status,
    CommentsResponseEntity? entity,
    bool? isReachedMax
  }) {
    return CommentState(
       isReachedMax: isReachedMax ??this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
