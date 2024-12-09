import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';

class MarkNotificationState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;
  final bool isReachedMax;

  const MarkNotificationState(
      {required this.error, required this.status, required this.entity,required this.isReachedMax});
       factory MarkNotificationState.initial() {
    return MarkNotificationState(
        entity: false,
        isReachedMax: false,
        error: '',
        status: CubitStatus.initial);
  }

  MarkNotificationState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
    bool? isReachedMax,
  }) {
    return MarkNotificationState(
      isReachedMax: isReachedMax??this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity,];
}


