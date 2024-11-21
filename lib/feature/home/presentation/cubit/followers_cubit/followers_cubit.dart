import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/followers_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/followers_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/user.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/followers_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

part 'followers_state.dart';

/// Eng.Nour Othman(meory)*

class FollowersCubit extends Cubit<FollowersState> {
  final FollowersUsecase usecase;

  FollowersCubit({
    required this.usecase,
  }) : super(FollowersState.initial());
  int page = 1;
  List<User>? allData = [];

  void getFollowers(
      {required BuildContext context,
      required FollowersRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
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
        allData?.addAll(data.data?.data ?? []);
        emit(
          state.copyWith(
            status: CubitStatus.success,
            entity: FollowersResponseEntity(
              data: FollowersData(data: allData),
            ),
          ),
        );
      },
    );
  }

  void loadMore(
      {required BuildContext context,
      required FollowersRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loadMore));
    page++;
    getFollowers(context: context, entity: entity);
  }
}
