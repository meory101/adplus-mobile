import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';

part 'advs_by_attribute_state.dart';

/// Eng.Nour Othman(meory)*

class AdvsByAttributeCubit extends Cubit<AdvsByAttributeState> {
  final GetAdvsByAttributeUsecase usecase;

  AdvsByAttributeCubit({
    required this.usecase,
  }) : super(AdvsByAttributeState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  void getAdvsByAttribute(
      {required BuildContext context,
      required AdvsByAttributeRequestEntity entity}) async {
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
        if ((data.data?.adData ?? []).length < EnumManager.paginationLength) {
          hasMoreItems = false;
        } else {
          currentPage++;
        }
        List<AdData>? existingItems = state.entity.data?.adData ?? [];
        List<AdData>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.adData ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.itemId == newItem.itemId)));
        emit(
          state.copyWith(
            status: CubitStatus.success,
            isReachedMax: !hasMoreItems,
            entity: AdvsByAttributeResponseEntity(
              data: AdvsByAttributeData(adData: updatedItems),
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
        entity: AdvsByAttributeResponseEntity(data: AdvsByAttributeData(adData: [],)),
        isReachedMax: false));
  }
}
