part of 'get_profile_info_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetProfileInfoState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetProfileInfoResponseEntity entity;

  const GetProfileInfoState(
      {required this.error, required this.status, required this.entity});

  factory GetProfileInfoState.initial() {
    return GetProfileInfoState(
        entity: GetProfileInfoResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetProfileInfoState copyWith({
    String? error,
    CubitStatus? status,
    GetProfileInfoResponseEntity? entity,
  }) {
    return GetProfileInfoState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
