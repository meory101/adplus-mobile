part of 'update_profile_image_cubit.dart';

/// Eng.Nour Othman(meory)*


class UpdateProfileImageState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const UpdateProfileImageState(
      {required this.error, required this.status, required this.entity});

  factory UpdateProfileImageState.initial() {
    return const UpdateProfileImageState(
        entity: false,
        error: '',
        status: CubitStatus.initial);
  }

  UpdateProfileImageState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return UpdateProfileImageState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
