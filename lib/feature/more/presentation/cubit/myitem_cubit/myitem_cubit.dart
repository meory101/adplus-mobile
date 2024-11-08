import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/edit_password_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/update_username_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_state.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/get_profile_info_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baghdadi

class MyitemCubit extends Cubit<MyitemState> {
  final MyitemUsecase usecase;

  MyitemCubit({
    required this.usecase,
  }) : super(MyitemState.initial());

  void myitem(
      {required BuildContext context,
      required MyItemRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage,  status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
