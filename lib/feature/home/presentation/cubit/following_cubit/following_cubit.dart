

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/following_usecase.dart';

import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/followers_request_entity.dart';
import '../../../domain/usecase/followers_usecase.dart';
import 'following_state.dart';


/// Eng.Nour Othman(meory)*

class FollowingCubit extends Cubit<FollowingState> {
  final FollowingUsecase usecase;

  FollowingCubit({
    required this.usecase,
  }) : super(FollowingState.initial());

  void getFollowings(
      {required BuildContext context,
      required FollowersRequestEntity entity}) async {
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
