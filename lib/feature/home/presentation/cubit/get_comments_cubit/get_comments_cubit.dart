import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/core/model/comment.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_comments_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/get_comments_request_entity.dart';
import '../../../domain/entity/response/get_comments_response_entity.dart';

part 'get_comments_state.dart';

/// Eng.Nour Othman(meory)*

class GetCommentsCubit extends Cubit<GetCommentsState> {
  final GetCommentsUsecase usecase;
  int currentPage = 1;
  List<Comment> comments = [];

  GetCommentsCubit({
    required this.usecase,
  }) : super(GetCommentsState.initial());

  void getComments(
      {required BuildContext context,
      required GetCommentsRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));

    entity.page = currentPage;
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
                        await ApiErrorHandler.mapFailure(failure: failure,buildContext: context);
;
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        comments.addAll(data.data?.data ?? []);
        emit(
          state.copyWith(
            status: CubitStatus.success,
            entity:
                GetCommentsResponseEntity(data: CommentsResult(data: comments)),
          ),
        );

        if (currentPage < (data.data?.pagination?.totalPages ?? 0)) {
          currentPage++;
        }
        state.copyWith(
          status: CubitStatus.success,
          isReachMax: true,
          entity:
              GetCommentsResponseEntity(data: CommentsResult(data: comments)),
        );
      },
    );
  }

}
