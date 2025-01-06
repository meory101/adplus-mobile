part of 'add_comment_cubit.dart';

/// Eng.Nour Othman(meory)*


class AddCommentState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const AddCommentState(
      {required this.error, required this.status, required this.entity});

  factory AddCommentState.initial() {
    return AddCommentState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  AddCommentState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return AddCommentState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
