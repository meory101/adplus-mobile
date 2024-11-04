
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_comment_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/banners_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../../domain/usecase/get_category_inside_page_usecase.dart';

part 'banners_state.dart';

/// Eng.Nour Othman(meory)*

class BannersCubit extends Cubit<BannersState> {
  final BannersUsecase usecase;

  BannersCubit({
    required this.usecase,
  }) : super(BannersState.initial());

  void getHomeBanners(
      {required BuildContext context,}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase();

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
