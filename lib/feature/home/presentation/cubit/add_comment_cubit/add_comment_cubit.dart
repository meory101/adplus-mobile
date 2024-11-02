
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_comment_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../../domain/usecase/get_category_inside_page_usecase.dart';

part 'add_comment_state.dart';

/// Eng.Nour Othman(meory)*

class AddCommentCubit extends Cubit<AddCommentState> {
  final AddCommentUsecase usecase;

  AddCommentCubit({
    required this.usecase,
  }) : super(AddCommentState.initial());

  void addComment(
      {required BuildContext context,
      required AddCommentRequestEntity entity}) async {
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
}
