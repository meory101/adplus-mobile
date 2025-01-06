part of 'profile_by_username_cubit.dart';

/// Eng.Hussaen Baghdadi()*

class ProfileByUsernameState extends Equatable {
  final String error;
  final CubitStatus status;
  final ProfileByUsernameResponseEntity entity;

  const ProfileByUsernameState({
    required this.error,
    required this.status,
    required this.entity,
  });

  factory ProfileByUsernameState.initial() {
    return ProfileByUsernameState(
      entity: ProfileByUsernameResponseEntity(),
      error: '',
      status: CubitStatus.initial,
    );
  }

  ProfileByUsernameState copyWith({
    String? error,
    CubitStatus? status,
    ProfileByUsernameResponseEntity? entity,
  }) {
    return ProfileByUsernameState(
      error: error ?? this.error,
      status: status ?? this.status,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [error, status, entity];
}