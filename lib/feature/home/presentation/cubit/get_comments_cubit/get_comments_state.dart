part of 'get_comments_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetCommentsState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCommentsResponseEntity entity;
  final bool? isReachMax;


  const GetCommentsState(
      {required this.error, required this.status, required this.entity,required this.isReachMax});

  factory GetCommentsState.initial() {
    return GetCommentsState(
      isReachMax: false,
        entity: GetCommentsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCommentsState copyWith({
    String? error,
    CubitStatus? status,
    GetCommentsResponseEntity? entity,
    bool? isReachMax,

  }) {
    return GetCommentsState(
       isReachMax: isReachMax ?? this.isReachMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
