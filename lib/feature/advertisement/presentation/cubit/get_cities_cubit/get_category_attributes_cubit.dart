
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_cities_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/get_category_attributes_request_entity.dart';
import '../../../domain/usecase/get_category_attributes_usecase.dart';
import 'get_category_attributes_state.dart';

/// Eng.Nour Othman(meory)*


class GetCitiesCubit extends Cubit<GetCitiesState> {
  final GetCitiesUsecase usecase;

  GetCitiesCubit({
    required this.usecase,
  }) : super(GetCitiesState.initial());

  void getCities({required BuildContext context,}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase();

    if (isClosed) return;
    result.fold(
          (failure) async {
        final ErrorEntity errorEntity =
        await ApiErrorHandler.mapFailure(failure:failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
          (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }


}
