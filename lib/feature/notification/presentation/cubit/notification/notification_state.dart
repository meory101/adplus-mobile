import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';

class NotificationState extends Equatable {
  final String error;
  final CubitStatus status;
  final NotificationsResponseEntity entity;
  final bool isReachedMax;

  const NotificationState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});
       factory NotificationState.initial() {
    return NotificationState(
        entity: NotificationsResponseEntity(),
        isReachedMax: false,
        error: '',
        status: CubitStatus.initial);
  }

  NotificationState copyWith({
    String? error,
    CubitStatus? status,
    NotificationsResponseEntity? entity,
    bool? isReachedMax,
  }) {
    return NotificationState(
      isReachedMax: isReachedMax??this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity,];
}


