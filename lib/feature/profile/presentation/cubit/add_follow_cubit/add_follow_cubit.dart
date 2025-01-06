import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/add_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/add_follow_response.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/add_follow_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';

part 'add_follow_state.dart';

/// Eng.Hussaen Baghdadi

class AddFollowCubit extends Cubit<AddFollowState> {
  final AddFollowUsecase usecase;

  AddFollowCubit({
    required this.usecase,
  }) : super(AddFollowState.initial());

  void addFollow({
    required BuildContext context,
    required AddFollowRequestEntity entity,
  }) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
        emit(state.copyWith(
          error: errorEntity.errorMessage,
          status: CubitStatus.error,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: CubitStatus.success,
          entity: data,
        ));
      },
    );
  }
}