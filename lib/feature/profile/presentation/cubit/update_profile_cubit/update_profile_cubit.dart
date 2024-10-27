import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/get_profile_info_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/update_profile_request_entity.dart';


part 'update_profile_state.dart';

/// Eng.Nour Othman(meory)*


class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUsecase usecase;

  UpdateProfileCubit({
    required this.usecase,
  }) : super(UpdateProfileState.initial());

  void getProfileInfo({required BuildContext context,required UpdateProfileRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity:entity );

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
