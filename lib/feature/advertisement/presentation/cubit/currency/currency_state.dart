

import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_cities_response_entity.dart';

import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/currency_response_entity.dart';
import '../../../domain/entity/response/get_category_attributes_response_entity.dart';

/// Eng.Nour Othman(meory)*


class CurrencyState extends Equatable {
  final String error;
  final CubitStatus status;
  final CurrencyResponseEntity entity;

  const CurrencyState(
      {required this.error, required this.status, required this.entity});

  factory CurrencyState.initial() {
    return CurrencyState(
        entity: CurrencyResponseEntity(),
        error: '',
        status: CubitStatus.initial);
  }

  CurrencyState copyWith({
    String? error,
    CubitStatus? status,
    CurrencyResponseEntity? entity,
  }) {
    return CurrencyState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
