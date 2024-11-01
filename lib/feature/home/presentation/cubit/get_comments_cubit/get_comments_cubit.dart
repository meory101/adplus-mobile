
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_comment_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_comments_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../../domain/entity/response/get_comments_response_entity.dart';
import '../../../domain/usecase/get_category_inside_page_usecase.dart';

part 'get_comments_state.dart';

/// Eng.Nour Othman(meory)*

class GetCommentsCubit extends Cubit<GetCommentsState> {
  final GetCommentsUsecase usecase;

  GetCommentsCubit({
    required this.usecase,
  }) : super(GetCommentsState.initial());
  List<CommentsResult> allData = [];
  int page = 1;


  void getNextPage({required BuildContext buildContext,required GetCommentsRequestEntity entity}) {
    if (state.isReachMax == true || state.status == CubitStatus.loadMore) {
      return;
    }

    emit(state.copyWith(status: CubitStatus.loadMore));
    page++;

    entity.page = page;
    getCommentsData(entity: entity,context: buildContext);
  }



  void getComments({
    required GetCommentsRequestEntity entity,
    required BuildContext context,
  }) async {
    clearData();
    initPagination();

    emit(state.copyWith(status: CubitStatus.loading));

    getCommentsData(
      context: context,
      entity: entity,
    );
  }


  void getCommentsData(
      {required BuildContext context,
      required GetCommentsRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }

  void initPagination() {
    page = 1;
  }
  void clearData() {
    allData = [];
  }
}
