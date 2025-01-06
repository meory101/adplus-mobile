
import 'package:equatable/equatable.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/followers_response_entity.dart';

/// Eng.Nour Othman(meory)*


class FollowingState extends Equatable {
  final String error;
  final CubitStatus status;
  final FollowersResponseEntity entity;
 final bool isReachedMax;


  const FollowingState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});

  factory FollowingState.initial() {
    return FollowingState(
      isReachedMax: false,
        entity: FollowersResponseEntity(),
        error:'',
        status: CubitStatus.initial);
  }

  FollowingState copyWith({
    String? error,
    CubitStatus? status,
    FollowersResponseEntity? entity,
    bool? isReachedMax
  }) {
    return FollowingState(
      isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
