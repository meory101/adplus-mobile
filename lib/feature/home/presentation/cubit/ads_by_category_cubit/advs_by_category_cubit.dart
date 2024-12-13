import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/ads_by_category_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/ads_by_category_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../domain/usecase/ads_by_category_usecase.dart';

part 'advs_by_category_state.dart';

/// Eng.Nour Othman(meory)*

class AdsByCategoryCubit extends Cubit<AdsByCategoryState> {
  final AdsByCategoryUsecase usecase;

  AdsByCategoryCubit({
    required this.usecase,
  }) : super(AdsByCategoryState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  void getAdvsByCategory(
      {required BuildContext context,
      required AdsByCategoryRequestEntity entity}) async {
    if (!hasMoreItems || state.status == CubitStatus.loading || state.status == CubitStatus.loadMore) return;
    emit(state.copyWith(status:currentPage==1? CubitStatus.loading: CubitStatus.loadMore));
    entity.page = currentPage;
    final result = await usecase(entity: entity);
    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await ApiErrorHandler.mapFailure(
            failure: failure, buildContext: context);

        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        if ((data.data?.data ?? []).length < EnumManager.paginationLength) {
          hasMoreItems = false;
        } else {
          currentPage++;
        }
        List<AdData>? existingItems = state.entity.data?.data ?? [];
        List<AdData>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.itemId == newItem.itemId)));
        emit(
          state.copyWith(
            status: CubitStatus.success,
            isReachedMax: !hasMoreItems,
            entity: AdsByCategoryResponseEntity(
              data: AdsByCategoryResult(data: updatedItems),
            ),
          ),
        );
      },
    );
  }

  void resetData() {
    currentPage = 1;
    hasMoreItems = true;
    emit(state.copyWith(
        status: CubitStatus.success,
        entity: AdsByCategoryResponseEntity(data: AdsByCategoryResult(data: [],)),
        isReachedMax: false));
  }
}
