import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/add_advertisement_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/update_adv_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import 'update_advertisement_state.dart';

/// Eng.Nour Othman(meory)*

class UpdateAdvertisementCubit extends Cubit<UpdateAdvertisementState> {
  final UpdateAdvUsecase usecase;

  UpdateAdvertisementCubit({
    required this.usecase,
  }) : super(UpdateAdvertisementState.initial());

  void updateAdvertisement(
      {required BuildContext context,
      required AddAdvertisementRequestEntity entity,
      required List<File> files}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity,files: files);

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
