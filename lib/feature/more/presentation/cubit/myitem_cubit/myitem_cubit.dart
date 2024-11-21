import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baghdadi

class MyitemCubit extends Cubit<MyitemState> {
  final MyitemUsecase usecase;

  MyitemCubit({
    required this.usecase,
  }) : super(MyitemState.initial());

  bool hasMoreItems = true;
  int currentPage = 1;

  Future<void> myitem({
    required BuildContext context,
    required MyItemRequestEntity entity,
  }) async {
    if (!hasMoreItems) return;

    emit(state.copyWith(status: CubitStatus.loading));

    final result =
        await usecase(entity: MyItemRequestEntity(page: currentPage));

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
            entity:
                MyItemResponseEntity(data: MyAdvsData(data: updatedItems))));
      },
    );
  }
}
