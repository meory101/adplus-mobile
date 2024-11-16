import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/remove_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/check_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/check_follow_uscase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/remove_follow_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/check_follow_request_entity.dart';
import '../../../domain/entity/response/remove_follow_response_entity.dart';


part 'remove_follow_state.dart';

/// Eng.Nour Othman(meory)*


class RemoveFollowCubit extends Cubit<RemoveFollowState> {
  final RemoveFollowUsecase usecase;

  RemoveFollowCubit({
    required this.usecase,
  }) : super(RemoveFollowState.initial());

  void removeFollow({required BuildContext context,required RemoveFollowRequestEntity entity}) async {
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
