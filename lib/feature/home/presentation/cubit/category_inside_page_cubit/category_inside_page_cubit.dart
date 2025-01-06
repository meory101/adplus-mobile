import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/usecase/get_categories_usecase.dart';
import '../../../domain/usecase/get_category_inside_page_usecase.dart';

part 'category_inside_page_state.dart';

/// Eng.Nour Othman(meory)*

class CategoryInsidePageCubit extends Cubit<CategoryInsidePageState> {
  final GetCategoryInsidePageUsecase usecase;

  CategoryInsidePageCubit({
    required this.usecase,
  }) : super(CategoryInsidePageState.initial());

  void getCategoryInsidePage(
      {required BuildContext context,
      required CategoryInsidePageRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
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
