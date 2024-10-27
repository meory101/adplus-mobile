import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/authentication/data/datasource/remote/auth_remote.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/logout_usecase.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/login_cubit/logout%20cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUsecase logoutUsecase;

  LogoutCubit({required this.logoutUsecase}) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    final Either<ApiFailure, LogoutResponseEntity> result =
        await logoutUsecase();

    emit(result.fold(
      (failure) => LogoutError(message: _mapFailureToMessage(failure)),
      (response) => LogoutSuccess(response: response),
    ));
  }

  String _mapFailureToMessage(ApiFailure failure) {
    // يمكن تعديل هذه الدالة لإرجاع رسائل مختلفة حسب نوع الخطأ
    return "حدث خطأ أثناء تسجيل الخروج";
  }
}
