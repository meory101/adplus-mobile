import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';

class RejectedAdsState extends Equatable {
  final String error;
  final CubitStatus status;
  final MyItemResponseEntity entity;
  final bool isReachedMax;

  const RejectedAdsState(
      {required this.error,
      required this.status,
      required this.entity,
      required this.isReachedMax});

  factory RejectedAdsState.initial() {
    return RejectedAdsState(
        isReachedMax: false,
        entity: MyItemResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  RejectedAdsState copyWith({
    String? error,
    CubitStatus? status,
    MyItemResponseEntity? entity,
    bool? isReachedMax,
  }) {
    return RejectedAdsState(
        isReachedMax: isReachedMax ?? this.isReachedMax,
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
