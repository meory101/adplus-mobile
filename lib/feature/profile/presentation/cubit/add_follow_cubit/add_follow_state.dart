part of 'add_follow_cubit.dart';

/// Eng.Hussaen Baghdadi

class AddFollowState extends Equatable {
  final String error;
  final CubitStatus status;
  final AddFollowResponseEntity entity;

  const AddFollowState({
    required this.error,
    required this.status,
    required this.entity,
  });

  factory AddFollowState.initial() {
    return AddFollowState(
      entity: AddFollowResponseEntity(),
      error: '',
      status: CubitStatus.initial,
    );
  }

  AddFollowState copyWith({
    String? error,
    CubitStatus? status,
    AddFollowResponseEntity? entity,
  }) {
    return AddFollowState(
      error: error ?? this.error,
      status: status ?? this.status,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [error, status, entity];
}
