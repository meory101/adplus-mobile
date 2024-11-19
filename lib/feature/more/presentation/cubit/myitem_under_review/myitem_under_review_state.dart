import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
 
class MyitemUnderReviewState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyItemResponseEntity entity;

  const MyitemUnderReviewState(
      {required this.error, required this.status, required this.entity});
       factory MyitemUnderReviewState.initial() {
    return MyitemUnderReviewState(
        entity: MyItemResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  MyitemUnderReviewState copyWith({
    String? error,
    CubitStatus? status,
    MyItemResponseEntity? entity,
  }) {
    return MyitemUnderReviewState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}


