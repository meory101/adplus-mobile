
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import 'package:mzad_damascus/feature/comment/domain/usecase/comments_usecase.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/add_favorite_uscase.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/usecase/liked_advertisements_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../domain/entity/comments_request_entity.dart';

part 'comment_state.dart';

/// Eng.Nour Othman(meory)*

class CommentCubit extends Cubit<CommentState> {
  final CommentsUsecase usecase;
  bool hasMoreItems = true;
  int currentPage = 1;
  CommentCubit({
    required this.usecase,
  }) : super(CommentState.initial());
  void getComments(
      {required BuildContext context,required CommentsRequestEntity entity}) async {
    if (!hasMoreItems ||
        state.status == CubitStatus.loading ||
        state.status == CubitStatus.loadMore) return;
    emit(state.copyWith(status:currentPage==1? CubitStatus.loading : CubitStatus.loadMore));
    entity.page = currentPage;
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
                        await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);;
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
          (data) {
        if ((data.data?.comments ?? []).length < EnumManager.paginationLength) {
          hasMoreItems = false;
        } else {
          currentPage++;
        }
        List<Comments>?  existingItems = state.entity.data?.comments ?? [];
        List<Comments>?  updatedItems = List.from(existingItems)
          ..addAll((data.data?.comments ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.commentId == newItem.comment)));
        emit(state.copyWith(
            status: CubitStatus.success,
            entity:
            CommentsResponseEntity(data: CommentAdData(comments: updatedItems)),
            isReachedMax: !hasMoreItems));
      },
    );
  }
  void resetData() {
    currentPage = 1;
    hasMoreItems = true;
    emit(state.copyWith(
        status: CubitStatus.success,
        entity: CommentsResponseEntity(data: CommentAdData(comments: [])),
        isReachedMax: false));
  }
}
