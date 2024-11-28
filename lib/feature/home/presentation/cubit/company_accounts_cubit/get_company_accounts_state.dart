part of 'get_company_accounts_cubit.dart';

/// Eng.Nour Othman(meory)*


class GetCompanyAccountState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCompanyAccountsResponseEntity entity;

  const GetCompanyAccountState(
      {required this.error, required this.status, required this.entity});

  factory GetCompanyAccountState.initial() {
    return GetCompanyAccountState(
        entity: GetCompanyAccountsResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCompanyAccountState copyWith({
    String? error,
    CubitStatus? status,
    GetCompanyAccountsResponseEntity? entity,
  }) {
    return GetCompanyAccountState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
