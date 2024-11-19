import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_under_review_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_under_review/myitem_under_review_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baghdadi

class MyitemUnderReviewCubit extends Cubit<MyitemUnderReviewState> {
  final MyitemUnderReviewUsecase usecase;

  MyitemUnderReviewCubit({
    required this.usecase,
  }) : super(MyitemUnderReviewState.initial());

  Future<void> myitemunderreview({
    required BuildContext context,
    required MyItemUnderReviewRequestEntity entity,
    bool loadMore = false,
  }) async {
    if (!loadMore) {
      emit(state.copyWith(status: CubitStatus.loading));
    }
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
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
