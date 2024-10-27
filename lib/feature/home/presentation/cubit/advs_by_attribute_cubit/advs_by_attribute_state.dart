part of 'advs_by_attribute_cubit.dart';

/// Eng.Nour Othman(meory)*


class AdvsByAttributeState extends Equatable {
  final String error;
  final CubitStatus status;
  final AdvsByAttributeResponseEntity entity;

  const AdvsByAttributeState(
      {required this.error, required this.status, required this.entity});

  factory AdvsByAttributeState.initial() {
    return AdvsByAttributeState(
        entity: AdvsByAttributeResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  AdvsByAttributeState copyWith({
    String? error,
    CubitStatus? status,
    AdvsByAttributeResponseEntity? entity,
  }) {
    return AdvsByAttributeState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
