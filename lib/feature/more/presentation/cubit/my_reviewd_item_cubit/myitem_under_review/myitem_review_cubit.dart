import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/my_reviewd_irem.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_under_review_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_under_review/myitem_under_review_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../../core/resource/enum_manager.dart';
import '../../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../../domain/entity/response/myitems_response_entity.dart';

/// Eng.Hussaen Baghdadi

class MyitemReviewCubit extends Cubit<MyitemReviewState> {
  final MyReviewdIrem usecase;

  MyitemReviewCubit({
    required this.usecase,
  }) : super(MyitemReviewState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;
  Future<void> myitemreview({
    required BuildContext context,
    required MyItemReviewRequestEntity entity,

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
}
