part of 'advs_by_attribute_cubit.dart';

/// Eng.Nour Othman(meory)*


class AdvsByAttributeState extends Equatable {
  final String error;
  final CubitStatus status;
  final AdvsByAttributeResponseEntity entity;
  final bool isReachedMax;

  const AdvsByAttributeState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory AdvsByAttributeState.initial() {
    return AdvsByAttributeState(
      isReachedMax: false,
        entity: AdvsByAttributeResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  AdvsByAttributeState copyWith({
    String? error,
    CubitStatus? status,
    AdvsByAttributeResponseEntity? entity,
    bool? isReachedMax
  }) {
    return AdvsByAttributeState(
      isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
