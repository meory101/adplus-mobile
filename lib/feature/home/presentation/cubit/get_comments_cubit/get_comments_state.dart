part of 'get_comments_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetCommentsState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCommentsResponseEntity entity;
   final bool? isReachedMax;


  const GetCommentsState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory GetCommentsState.initial() {
    return GetCommentsState(
        isReachedMax: false,
        entity: GetCommentsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCommentsState copyWith({
    String? error,
    CubitStatus? status,
    GetCommentsResponseEntity? entity,
    bool? isReachedMax,

  }) {
    return GetCommentsState(
        isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
