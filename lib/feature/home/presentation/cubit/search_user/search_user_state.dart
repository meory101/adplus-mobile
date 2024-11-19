part of 'search_user_cubit.dart';

/// Eng.Nour Othman(meory)*


class SearchUserState extends Equatable {
  final String error;
  final CubitStatus status;
  final SearchUserResponseEntity entity;

  const SearchUserState(
      {required this.error, required this.status, required this.entity});

  factory SearchUserState.initial() {
    return SearchUserState(
        entity: SearchUserResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  SearchUserState copyWith({
    String? error,
    CubitStatus? status,
    SearchUserResponseEntity? entity,
  }) {
    return SearchUserState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
