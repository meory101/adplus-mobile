import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/profile_by_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/profile_by_username_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';

part 'profile_by_username_state.dart';

/// Eng.Hussaen Baghdadi

class ProfileByUsernameCubit extends Cubit<ProfileByUsernameState> {
  final GetProfileByUsernameUsecase usecase;

  ProfileByUsernameCubit({
    required this.usecase,
  }) : super(ProfileByUsernameState.initial());

  void getProfileByUsername({
    required BuildContext context,
    required ProfileByUsernameRequestEntity entity,
  }) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
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