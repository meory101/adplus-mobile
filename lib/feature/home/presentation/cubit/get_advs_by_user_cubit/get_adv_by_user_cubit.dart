import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_by_user_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../more/domain/entity/response/myitems_response_entity.dart';
import '../../../domain/entity/request/get_advs_by_user_request_entity.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';

part 'get_adv_by_user_state.dart';

/// Eng.Nour Othman(meory)*

class GetAdvByUserCubit extends Cubit<GetAdvByUserState> {
  final GetAdvByUserUsecase usecase;

  GetAdvByUserCubit({
    required this.usecase,
  }) : super(GetAdvByUserState.initial());

  void getAdvsByUser(
      {required BuildContext context,
      required GetAdvsByUserRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
                        await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
;
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
