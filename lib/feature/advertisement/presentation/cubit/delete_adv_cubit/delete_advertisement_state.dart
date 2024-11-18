

import 'package:equatable/equatable.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/get_category_attributes_response_entity.dart';

/// Eng.Nour Othman(meory)*


class DeleteAdvertisementState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const DeleteAdvertisementState(
      {required this.error, required this.status, required this.entity});

  factory DeleteAdvertisementState.initial() {
    return const DeleteAdvertisementState(
        entity:true,
        error: '',
        status: CubitStatus.initial);
  }

  DeleteAdvertisementState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return DeleteAdvertisementState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
