
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_company_account_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/check_like_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_company_accounts_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_comment_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_reaction_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/check_like_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_adv_details_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_company_accounts_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entity/request/check_like_request_entity.dart';
import '../../../domain/entity/response/get_adv_details_response_entity.dart';
import '../../../domain/usecase/get_category_inside_page_usecase.dart';

part 'get_company_accounts_state.dart';

/// Eng.Nour Othman(meory)*

class GetCompanyAccountsCubit extends Cubit<GetCompanyAccountState> {
  final GetCompanyAccountsUsecase usecase;

  GetCompanyAccountsCubit({
    required this.usecase,
  }) : super(GetCompanyAccountState.initial());

  void getCompanyAccounts(
      {required BuildContext context,
      required GetCompanyAccountRequestEntity entity}) async {
    emit(state.copyWith(status: CubitStatus.loading));
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
        emit(state.copyWith(status: CubitStatus.success, entity: data));
      },
    );
  }
}
