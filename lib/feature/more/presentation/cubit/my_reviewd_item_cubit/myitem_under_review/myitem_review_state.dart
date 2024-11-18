import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
 
class MyitemReviewState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyItemResponseEntity entity;

  const MyitemReviewState(
      {required this.error, required this.status, required this.entity});
       factory MyitemReviewState.initial() {
    return MyitemReviewState(
        entity: MyItemResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  MyitemReviewState copyWith({
    String? error,
    CubitStatus? status,
    MyItemResponseEntity? entity,
  }) {
    return MyitemReviewState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}


