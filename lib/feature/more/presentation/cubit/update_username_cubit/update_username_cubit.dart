
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/update_username_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_state.dart';
  import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baghdadi

class UpdateUsernameCubit extends Cubit<UpdateUsernameState> {
  final UpdateUsernameUsecase usecase;

  UpdateUsernameCubit({
    required this.usecase,
  }) : super(UpdateUsernameState.initial());

  void updateusername(
      {required BuildContext context,
      required UpdateUsernameRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    entity.platform = 'app';
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
                        await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);

        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
