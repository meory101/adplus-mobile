import 'package:flutter/foundation.dart';
 import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final LogoutResponseEntity response;

  LogoutSuccess({required this.response});
}

class LogoutError extends LogoutState {
  final String message;

  LogoutError({required this.message});
}
