part of 'get_adv_by_user_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetAdvByUserState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyItemResponseEntity entity;
  final bool isReachedMax;

  const GetAdvByUserState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory GetAdvByUserState.initial() {
    return GetAdvByUserState(
      isReachedMax: false
        ,
        entity: MyItemResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetAdvByUserState copyWith({
    String? error,
    CubitStatus? status,
    MyItemResponseEntity? entity,
    bool? isReachedMax
  }) {
    return GetAdvByUserState(
      isReachedMax: isReachedMax?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
