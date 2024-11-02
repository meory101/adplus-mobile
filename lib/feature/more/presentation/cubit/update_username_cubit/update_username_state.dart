import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
 
class UpdateUsernameState extends Equatable {
  final String error;
  final CubitStatus status;
  final UpdateUsernameResponseEntity entity;

  const UpdateUsernameState(
      {required this.error, required this.status, required this.entity});
       factory UpdateUsernameState.initial() {
    return UpdateUsernameState(
        entity: UpdateUsernameResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  UpdateUsernameState copyWith({
    String? error,
    CubitStatus? status,
    UpdateUsernameResponseEntity? entity,
  }) {
    return UpdateUsernameState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}


