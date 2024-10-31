import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/register_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/register_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/register_usecase.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/register_cubit/register_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baaghdadi

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase usecase;

  RegisterCubit({
    required this.usecase,
  }) : super(RegisterState.initial());

  void register({
    required BuildContext context,
    required RegisterRequestEntity entity,
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
         if (data.data['user']['is_verified'] == 0) {
           emit(state.copyWith(status: CubitStatus.success));
        } else {
           emit(state.copyWith(
              status: CubitStatus.error, error: "Account is already verified"));
        }
      },
    );
  }
}
