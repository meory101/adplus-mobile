import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/myfollowers_usecase.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../home/domain/entity/response/user.dart';

/// Eng.Nour Othman(meory)*

class MyFollowersCubit extends Cubit<MyFollowersState> {
  final GetMyFollowersUsecase usecase;

  MyFollowersCubit({
    required this.usecase,
  }) : super(MyFollowersState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;
  void getMyFollowers({
    required BuildContext context,
    required MyFollowersRequestEntity entity,
  }) async {
    if (!hasMoreItems || state.status == CubitStatus.loading || state.status == CubitStatus.loadMore) return;
    emit(state.copyWith(status:currentPage==1? CubitStatus.loading : CubitStatus.loadMore));
    entity.page = currentPage;

    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure, buildContext: context);
        emit(state.copyWith(
          error: errorEntity.errorMessage,
          status: CubitStatus.error,
        ));
      },
          (data) {
        if ((data.data?.data ?? []).length < EnumManager.paginationLength) {
          hasMoreItems = false;
        } else {
          currentPage++;
        }

        List<User>? existingItems = state.entity.data?.data ?? [];
        List<User>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.followingId == newItem.followingId)));

      emit(state.copyWith(
            status: CubitStatus.success,
            entity:
            MyFollowersResponseEntity(data: MyFollowersData(data: updatedItems)),isReachedMax: !hasMoreItems));
      },
    );
  }
}
