
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_error/api_error.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../domain/entity/request/get_category_attributes_request_entity.dart';
import '../../domain/usecase/get_category_attributes_usecase.dart';
import 'get_category_attributes_state.dart';

/// Eng.Nour Othman(meory)*


class GetCategoryAttributesCubit extends Cubit<GetCategoryAttributesState> {
  final GetCategoryAttributesUsecase usecase;

  GetCategoryAttributesCubit({
    required this.usecase,
  }) : super(GetCategoryAttributesState.initial());

  void getCategoryAttributes({required BuildContext context,required GetCategoryAttributesRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
          (failure) async {
        final ErrorEntity errorEntity =
        await ApiErrorHandler.mapFailure(failure: failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
          (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }


}
