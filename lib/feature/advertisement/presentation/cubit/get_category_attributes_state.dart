

import 'package:equatable/equatable.dart';

import '../../../../core/resource/cubit_status_manager.dart';
import '../../domain/entity/response/get_category_attributes_response_entity.dart';

/// Eng.Nour Othman(meory)*


class GetCategoryAttributesState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCategoryAttributesResponseEntity entity;

  const GetCategoryAttributesState(
      {required this.error, required this.status, required this.entity});

  factory GetCategoryAttributesState.initial() {
    return GetCategoryAttributesState(
        entity: GetCategoryAttributesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCategoryAttributesState copyWith({
    String? error,
    CubitStatus? status,
    GetCategoryAttributesResponseEntity? entity,
  }) {
    return GetCategoryAttributesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
