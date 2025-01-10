import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_by_user_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../more/domain/entity/response/myitems_response_entity.dart';
import '../../../domain/entity/request/get_advs_by_user_request_entity.dart';
import '../../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';

part 'get_adv_by_user_state.dart';

/// Eng.Nour Othman(meory)*

class GetAdvByUserCubit extends Cubit<GetAdvByUserState> {
  final GetAdvByUserUsecase usecase;

  GetAdvByUserCubit({
    required this.usecase,
  }) : super(GetAdvByUserState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  void getAdvsByUser(
      {required BuildContext context,
      required GetAdvsByUserRequestEntity entity}) async {
    if (!hasMoreItems ||
        state.status == CubitStatus.loading ||
        state.status == CubitStatus.loadMore) {
      return;
    }
    emit(state.copyWith(
        status: currentPage == 1 ? CubitStatus.loading : CubitStatus.loadMore));
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
        emit(state.copyWith(
            status: CubitStatus.success,
            entity: MyItemResponseEntity(data: MyAdvsData(data: updatedItems)),
            isReachedMax: !hasMoreItems));
      },
    );
  }
}
