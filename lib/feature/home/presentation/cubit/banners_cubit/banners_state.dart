part of 'banners_cubit.dart';

/// Eng.Nour Othman(meory)*


class BannersState extends Equatable {
  final String error;
  final CubitStatus status;
  final BannersResponseEntity entity;

  const BannersState(
      {required this.error, required this.status, required this.entity});

  factory BannersState.initial() {
    return BannersState(
        entity: BannersResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  BannersState copyWith({
    String? error,
    CubitStatus? status,
    BannersResponseEntity? entity,
  }) {
    return BannersState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
