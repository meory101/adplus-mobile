import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';

/// Eng.Hussaen Baghdadi(meory)*

class MyFollowingState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyFollowingResponseEntity entity;

  const MyFollowingState({
    required this.error,
    required this.status,
    required this.entity,
  });

  factory MyFollowingState.initial() {
    return MyFollowingState(
      entity: MyFollowingResponseEntity(),
      error: '',
      status: CubitStatus.initial,
    );
  }

  MyFollowingState copyWith({
    String? error,
    CubitStatus? status,
    MyFollowingResponseEntity? entity,
  }) {
    return MyFollowingState(
      error: error ?? this.error,
      status: status ?? this.status,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [error, status, entity];
}