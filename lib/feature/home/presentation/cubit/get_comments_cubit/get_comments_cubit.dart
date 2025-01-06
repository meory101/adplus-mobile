import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/model/comment.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_comments_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../domain/entity/request/get_comments_request_entity.dart';
import '../../../domain/entity/response/get_comments_response_entity.dart';

part 'get_comments_state.dart';

/// Eng.Nour Othman(meory)*

class GetCommentsCubit extends Cubit<GetCommentsState> {
  final GetCommentsUsecase usecase;
  bool hasMoreItems = true;
  int currentPage = 1;

  GetCommentsCubit({
    required this.usecase,
  }) : super(GetCommentsState.initial());

  void getComments(
      {required BuildContext context,
      required GetCommentsRequestEntity entity}) async {
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
        List<Comment>? existingItems = state.entity.data?.data ?? [];
        List<Comment>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.commentId == newItem.commentId)));
        emit(state.copyWith(
            status: CubitStatus.success,
            entity:
            GetCommentsResponseEntity(data: CommentsResult(data: updatedItems)),
            isReachedMax: !hasMoreItems));
      },
    );
  }

  void resetData() {
    currentPage = 1;
    hasMoreItems = true;
    emit(state.copyWith(
        status: CubitStatus.success,
        entity: GetCommentsResponseEntity(data: CommentsResult(data: [])),
        isReachedMax: false));
  }
}
