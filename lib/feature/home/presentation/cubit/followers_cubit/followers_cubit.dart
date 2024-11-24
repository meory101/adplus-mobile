import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/followers_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/followers_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/followers_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../domain/entity/response/user.dart';

part 'followers_state.dart';

/// Eng.Nour Othman(meory)*

class FollowersCubit extends Cubit<FollowersState> {
  final FollowersUsecase usecase;

  FollowersCubit({
    required this.usecase,
  }) : super(FollowersState.initial());
  bool hasMoreItems = true;
  int currentPage = 1;

  void getFollowers(
      {required BuildContext context,
      required FollowersRequestEntity entity}) async {
    if (!hasMoreItems || state.status == CubitStatus.loading || state.status == CubitStatus.loadMore) return;
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

        List<User>? existingItems = state.entity.data?.data ?? [];
        List<User>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.followingId == newItem.followingId)));

        emit(state.copyWith(
            status: CubitStatus.success,
            entity:
            FollowersResponseEntity(data: FollowersData(data: updatedItems)),isReachedMax: !hasMoreItems));
      },

    );


  }

}
