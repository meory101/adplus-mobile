import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/rejected_ads_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/rejected_ads_cubit/rejected_ads_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../domain/entity/response/myitems_response_entity.dart';

/// Eng.Hussaen Baghdadi

class RejectedAdsCubit extends Cubit<RejectedAdsState> {
  final RejectedAdsUsecase usecase;

  RejectedAdsCubit({
    required this.usecase,
  }) : super(RejectedAdsState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  Future<void> getRejectedAds({
    required BuildContext context,
    required MyItemRequestEntity entity,
    bool loadMore = false,
  }) async {
    if (!hasMoreItems ||
        state.status == CubitStatus.loading ||
        state.status == CubitStatus.loadMore) return;
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
  void resetData()async{
    currentPage=1;
  }
}
