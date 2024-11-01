import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/reset_passwod_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';

/// Eng.Hussaen Baaghdadi

class ResetCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase usecase;

  ResetCubit({
    required this.usecase,
  }) : super(ResetPasswordState.initial());

  void resetPassword({
    required BuildContext context,
    required PasswordResetRequestEntity entity,
  }) async {
    emit(state.copyWith(status: CubitStatus.loading));

    // استخدم نتيجة إعادة تعيين كلمة المرور
    final result = await usecase(entity: entity);

    // تحقق مما إذا كان Cubit مغلقًا
    if (isClosed) return;

    // معالجة النتيجة
    result.fold(
      (failure) async {
        // تحويل الخطأ إلى كائن خطأ مناسب
        final ErrorEntity errorEntity =
            await ApiErrorHandler.mapFailure(failure: failure);
        emit(state.copyWith(
          error: errorEntity.errorMessage,
          status: CubitStatus.error,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: CubitStatus.success,
          error: null,
        ));
      },
    );
  }
}
