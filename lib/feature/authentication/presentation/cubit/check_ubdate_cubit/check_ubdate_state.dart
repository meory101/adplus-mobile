part of 'check_ubdate_cubit.dart';

/// Eng.Nour Othman(meory)*


class CheckUbdateState extends Equatable {
  final String error;
  final CubitStatus status;
  final CheckUpdateAvailabilityResponseEntity entity;

  const CheckUbdateState(
      {required this.error, required this.status, required this.entity});

  factory CheckUbdateState.initial() {
    return CheckUbdateState(
        entity: CheckUpdateAvailabilityResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CheckUbdateState copyWith({
    String? error,
    CubitStatus? status,
    CheckUpdateAvailabilityResponseEntity? entity,
  }) {
    return CheckUbdateState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
