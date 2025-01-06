import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/favorites_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../home/domain/entity/response/get_adv_details_response_entity.dart';
import '../../../domain/entity/request/favorites_request_entity.dart';
import '../../../domain/entity/response/favorites_response_entity.dart';

part 'favorites_state.dart';

/// Eng.Nour Othman(meory)*

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesUsecase usecase;

  FavoritesCubit({
    required this.usecase,
  }) : super(FavoritesState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  void getMyFavorites(
      {required BuildContext context,
      required MyFavoritesRequestEntity entity}) async {
    if (!hasMoreItems ||
        state.status == CubitStatus.loading ||
        state.status == CubitStatus.loadMore) {
      return;
    }
    emit(state.copyWith(status:currentPage==1? CubitStatus.loading : CubitStatus.loadMore));
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
        List<AdvDetails>? existingItems = state.entity.data?.data ?? [];
        List<AdvDetails>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.itemId == newItem.itemId)));
        emit(state.copyWith(
            status: CubitStatus.success,
            entity:
                FavoritesResponseEntity(data: FavoriteData(data: updatedItems)),
            isReachedMax: !hasMoreItems));
      },
    );
  }

  void resetData() {
    currentPage = 1;
    hasMoreItems = true;
    emit(state.copyWith(
        status: CubitStatus.success,
        entity: FavoritesResponseEntity(data: FavoriteData(data: [])),
        isReachedMax: false));
  }
}
