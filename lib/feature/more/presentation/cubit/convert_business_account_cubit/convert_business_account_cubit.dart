import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/convert_business_account_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/verfiyusername_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import 'convert_business_account_state.dart';

/// Eng.Hussaen Baghdadi

class ConvertBusinessAccountCubit extends Cubit<ConvertBusinessAccountState> {
  final ConvertBusinessAccountUsecase usecase;

  ConvertBusinessAccountCubit({
    required this.usecase,
  }) : super(ConvertBusinessAccountState.initial());

  void convertToBusinessAccount(
      {required BuildContext context, required File? file}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(file: file);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await ApiErrorHandler.mapFailure(
            failure: failure, buildContext: context);

        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
