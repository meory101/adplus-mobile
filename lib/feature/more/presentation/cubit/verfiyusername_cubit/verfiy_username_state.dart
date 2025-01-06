import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/verfiy_username_response_entity.dart';
 
class VerfiyUsernameState extends Equatable {
  final String error;
  final CubitStatus status;
  final VerifyUsernameResponseEntity entity;

  const VerfiyUsernameState(
      {required this.error, required this.status, required this.entity});
  factory VerfiyUsernameState.initial() {
    return VerfiyUsernameState(
        entity: VerifyUsernameResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  VerfiyUsernameState copyWith({
    String? error,
    CubitStatus? status,
    VerifyUsernameResponseEntity? entity,
  }) {
    return VerfiyUsernameState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
