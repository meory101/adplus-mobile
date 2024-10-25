part of 'category_inside_page_cubit.dart';

/// Eng.Nour Othman(meory)*


class LoginState extends Equatable {
  final String error;
  final CubitStatus status;
  final LoginResponseEntity entity;

  const LoginState(
      {required this.error, required this.status, required this.entity});

  factory LoginState.initial() {
    return LoginState(
        entity: LoginResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  LoginState copyWith({
    String? error,
    CubitStatus? status,
    LoginResponseEntity? entity,
  }) {
    return LoginState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
