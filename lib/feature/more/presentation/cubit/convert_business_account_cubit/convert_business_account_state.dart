import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/verfiy_username_response_entity.dart';

class ConvertBusinessAccountState extends Equatable {
  final String error;
  final CubitStatus status;
  final bool entity;

  const ConvertBusinessAccountState(
      {required this.error, required this.status, required this.entity});

  factory ConvertBusinessAccountState.initial() {
    return const ConvertBusinessAccountState(
        entity: false
        , error: '', status: CubitStatus.initial);
  }

  ConvertBusinessAccountState copyWith({
    String? error,
    CubitStatus? status,
    bool? entity,
  }) {
    return ConvertBusinessAccountState(
        error: error ?? this.error,
        status: status ?? this.status,
        entity: entity ?? this.entity);
  }

  @override
  List<Object> get props => [error, status, entity];
}
