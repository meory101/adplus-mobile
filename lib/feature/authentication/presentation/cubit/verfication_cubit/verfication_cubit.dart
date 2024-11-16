import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/login_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/verfication_usecase.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import 'verfication_state.dart';

/// Eng.Nour Othman(meory)*

class VerficationCubit extends Cubit<VerficationState> {
  final VerficationUsecase usecase;

  VerficationCubit({
    required this.usecase,
  }) : super(VerficationState.initial());

  void verifyCode(String code,
      {required BuildContext context,
      required VerificationRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
                        await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
;
        emit(state.copyWith(
          error: errorEntity.errorMessage,
          status: CubitStatus.error,
        ));
      },
      (data) {
        AppSharedPreferences.cashToken(token: data.data?.accessToken ?? "");
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
