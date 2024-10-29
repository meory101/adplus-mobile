part of 'adv_details_cubit.dart';

/// Eng.Nour Othman(meory)*


class AdvDetailsState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetAdvDetailsResponseEntity entity;

  const AdvDetailsState(
      {required this.error, required this.status, required this.entity});

  factory AdvDetailsState.initial() {
    return AdvDetailsState(
        entity: GetAdvDetailsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  AdvDetailsState copyWith({
    String? error,
    CubitStatus? status,
    GetAdvDetailsResponseEntity? entity,
  }) {
    return AdvDetailsState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
