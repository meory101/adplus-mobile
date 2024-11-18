

import 'package:equatable/equatable.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/get_category_attributes_response_entity.dart';

/// Eng.Nour Othman(meory)*


class UpdateAdvertisementState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const UpdateAdvertisementState(
      {required this.error, required this.status, required this.entity});

  factory UpdateAdvertisementState.initial() {
    return const UpdateAdvertisementState(
        entity:true,
        error: '',
        status: CubitStatus.initial);
  }

  UpdateAdvertisementState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return UpdateAdvertisementState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
