part of 'update_profile_cubit.dart';

/// Eng.Nour Othman(meory)*


class UpdateProfileState extends Equatable {
  final String error;
  final CubitStatus status;
  final UpdateProfileResponseEntity entity;

  const UpdateProfileState(
      {required this.error, required this.status, required this.entity});

  factory UpdateProfileState.initial() {
    return UpdateProfileState(
        entity: UpdateProfileResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  UpdateProfileState copyWith({
    String? error,
    CubitStatus? status,
    UpdateProfileResponseEntity? entity,
  }) {
    return UpdateProfileState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
