import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/add_advertisement_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/add_advertisement_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/get_category_attributes_request_entity.dart';
import '../../../domain/usecase/get_category_attributes_usecase.dart';
import 'add_advertisement_state.dart';

/// Eng.Nour Othman(meory)*

class AddAdvertisementCubit extends Cubit<AddAdvertisementState> {
  final AddAdvertisementUsecase usecase;

  AddAdvertisementCubit({
    required this.usecase,
  }) : super(AddAdvertisementState.initial());

  void addAdvertisement(
      {required BuildContext context,
      required AddAdvertisementRequestEntity entity,
      required List<File> files}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity,files: files);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
