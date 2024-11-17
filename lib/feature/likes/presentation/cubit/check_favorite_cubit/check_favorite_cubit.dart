
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/check_favorite_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/add_favorite_uscase.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/check_favorite_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

part 'check_favorite_state.dart';

/// Eng.Nour Othman(meory)*

class CheckFavoriteCubit extends Cubit<CheckFavoriteState> {
  final CheckFavoriteUscase usecase;

  CheckFavoriteCubit({
    required this.usecase,
  }) : super(CheckFavoriteState.initial());

  void checkFavorite(
      {required BuildContext context,
      required FavoriteRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
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
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
