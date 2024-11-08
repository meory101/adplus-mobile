 
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';

/// Eng.Hussaen Baghdadi(meory)*

class MyFollowersState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyFollowersResponseEntity entity;

  const MyFollowersState({
    required this.error,
    required this.status,
    required this.entity,
  });

  factory MyFollowersState.initial() {
    return MyFollowersState(
      entity: MyFollowersResponseEntity(),
      error: '',
      status: CubitStatus.initial,
    );
  }

  MyFollowersState copyWith({
    String? error,
    CubitStatus? status,
    MyFollowersResponseEntity? entity,
  }) {
    return MyFollowersState(
      error: error ?? this.error,
      status: status ?? this.status,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [error, status, entity];
}