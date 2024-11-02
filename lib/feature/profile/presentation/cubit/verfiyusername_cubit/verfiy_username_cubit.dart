import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/get_profile_info_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_username_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/verfiyusername_usecase.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_username_cubit/update_username_state.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/verfiyusername_cubit/verfiy_username_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baghdadi

class VerfiyUsernameCubit extends Cubit<VerfiyUsernameState> {
  final VerfiyusernameUsecase usecase;

  VerfiyUsernameCubit({
    required this.usecase,
  }) : super(VerfiyUsernameState.initial());

  void verfiyusername(
      {required BuildContext context,
      required VerifyUsernameRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    entity.platform = 'web';
    final result = await usecase(entity: entity);

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
