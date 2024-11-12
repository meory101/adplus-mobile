part of 'add_reaction_cubit.dart';

/// Eng.Nour Othman(meory)*


class AddReactionState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const AddReactionState(
      {required this.error, required this.status, required this.entity});

  factory AddReactionState.initial() {
    return const AddReactionState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  AddReactionState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return AddReactionState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
