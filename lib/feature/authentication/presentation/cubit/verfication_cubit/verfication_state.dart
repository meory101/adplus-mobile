 

 
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';

class VerficationState extends Equatable {
  final String error;
  final CubitStatus status;
  final VerificationResponseEntity entity;

  const VerficationState(
      {required this.error, required this.status, required this.entity});

  factory VerficationState.initial() {
    return VerficationState(
        entity: VerificationResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  VerficationState copyWith({
    String? error,
    CubitStatus? status,
    VerificationResponseEntity? entity,
  }) {
    return VerficationState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
