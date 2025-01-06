
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/currency_usecase.dart';
import '../../../../../core/api/api_error/api_error.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import 'currency_state.dart';

/// Eng.Nour Othman(meory)*


class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyUsecase usecase;

  CurrencyCubit({
    required this.usecase,
  }) : super(CurrencyState.initial());

  void getCurrencies({required BuildContext context,}) async {
    emit(state.copyWith(status: CubitStatus.loading));
    final result = await usecase();

    if (isClosed) return;
    result.fold(
          (failure) async {
        final ErrorEntity errorEntity =
        await ApiErrorHandler.mapFailure(failure:failure,buildContext: context);

        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
          (data) {
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }


}
