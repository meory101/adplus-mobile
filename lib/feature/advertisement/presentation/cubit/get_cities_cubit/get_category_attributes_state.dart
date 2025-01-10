

import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_cities_response_entity.dart';

import '../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Nour Othman(meory)*


class GetCitiesState extends Equatable {
  final String error;
  final CubitStatus status;
  final GetCitiesResponseEntity entity;

  const GetCitiesState(
      {required this.error, required this.status, required this.entity});

  factory GetCitiesState.initial() {
    return GetCitiesState(
        entity: GetCitiesResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  GetCitiesState copyWith({
    String? error,
    CubitStatus? status,
    GetCitiesResponseEntity? entity,
  }) {
    return GetCitiesState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
