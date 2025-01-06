

import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';

class LogoutState extends Equatable {
  final String error;
  final CubitStatus status;
  final LogoutResponseEntity entity;

  const LogoutState(
      {required this.error, required this.status, required this.entity});

  factory LogoutState.initial() {
    return LogoutState(
        entity: LogoutResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  LogoutState copyWith({
    String? error,
    CubitStatus? status,
    LogoutResponseEntity? entity,
  }) {
    return LogoutState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
