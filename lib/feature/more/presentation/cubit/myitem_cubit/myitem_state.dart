import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
 
class MyitemState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyItemResponseEntity entity;

  const MyitemState(
      {required this.error, required this.status, required this.entity});
       factory MyitemState.initial() {
    return MyitemState(
        entity: MyItemResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  MyitemState copyWith({
    String? error,
    CubitStatus? status,
    MyItemResponseEntity? entity,
  }) {
    return MyitemState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}


