import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/forget_password_response_entity.dart';

/// Eng.Nour Othman(meory)*

class ForgetPasswordState extends Equatable {
  final String error;
  final CubitStatus status;
  final ForgetPasswordResponseEntity entity;

  const ForgetPasswordState(
      {required this.error, required this.status, required this.entity});

  factory ForgetPasswordState.initial() {
    return ForgetPasswordState(
        entity: ForgetPasswordResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  ForgetPasswordState copyWith({
    String? error,
    CubitStatus? status,
    ForgetPasswordResponseEntity? entity,
  }) {
    return ForgetPasswordState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
