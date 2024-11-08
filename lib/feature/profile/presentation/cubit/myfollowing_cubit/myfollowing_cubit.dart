import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/usecase/myfollowing_usecase.dart';


class MyFollowingCubit extends Cubit<MyFollowingState> {
  final GetMyFollowingUsecase usecase;

  MyFollowingCubit({
    required this.usecase,
  }) : super(MyFollowingState.initial());

  void getMyFollowing({
    required BuildContext context,
    required MyFollowingRequestEntity entity,
  }) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure);
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