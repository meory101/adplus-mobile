part of 'comment_cubit.dart';

/// Eng.Nour Othman(meory)*


class CommentState extends Equatable {
  final String error;
  final CubitStatus status;
  final CommentsResponseEntity entity;

  const CommentState(
      {required this.error, required this.status, required this.entity});

  factory CommentState.initial() {
    return CommentState(
        entity: CommentsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CommentState copyWith({
    String? error,
    CubitStatus? status,
    CommentsResponseEntity? entity,
  }) {
    return CommentState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
