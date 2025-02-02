import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_under_review_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_under_review/myitem_under_review_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../domain/entity/response/myitems_response_entity.dart';

/// Eng.Hussaen Baghdadi

class MyitemUnderReviewCubit extends Cubit<MyitemUnderReviewState> {
  final MyitemUnderReviewUsecase usecase;

  MyitemUnderReviewCubit({
    required this.usecase,
  }) : super(MyitemUnderReviewState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;
  Future<void> myitemunderreview({
    required BuildContext context,
    required MyItemUnderReviewRequestEntity entity,
    bool loadMore = false,
  }) async {
    if (!hasMoreItems || state.status == CubitStatus.loading || state.status == CubitStatus.loadMore) return;
    emit(state.copyWith(status: currentPage == 1 ? CubitStatus.loading : CubitStatus.loadMore));
    entity.page = currentPage;
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

            entity:
            MyItemResponseEntity(data: MyAdvsData(data: updatedItems)),isReachedMax: !hasMoreItems));
      },
    );
  }
  void resetData()async{
    currentPage=1;
    hasMoreItems = true;
    emit(state.copyWith(
        status: CubitStatus.success,
        entity: MyItemResponseEntity(data: MyAdvsData(data: [])),
        isReachedMax: false));

  }
}
