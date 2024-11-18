import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/delete_adv_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import 'delete_advertisement_state.dart';

/// Eng.Nour Othman(meory)*

class DeleteAdvertisementCubit extends Cubit<DeleteAdvertisementState> {
  final DeleteAdvUsecase usecase;

  DeleteAdvertisementCubit({
    required this.usecase,
  }) : super(DeleteAdvertisementState.initial());

  void deleteAdvertisement(
      {required BuildContext context,
      required DeleteAdvRequestEntity entity,}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
