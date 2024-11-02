import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
 
class EditPasswordState extends Equatable {
  final String error;
  final CubitStatus status;
  final EditPasswordResponseEntity entity;

  const EditPasswordState(
      {required this.error, required this.status, required this.entity});
       factory EditPasswordState.initial() {
    return EditPasswordState(
        entity: EditPasswordResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  EditPasswordState copyWith({
    String? error,
    CubitStatus? status,
    EditPasswordResponseEntity? entity,
  }) {
    return EditPasswordState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}


