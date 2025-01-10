import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/request/mark_read_notification_request_entity.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/usecases/mark_read_notification.dart';
import 'mark_read_notification_state.dart';

class MarkNotificationCubit extends Cubit<MarkNotificationState> {
  final MarkReadNotification usecase;

  MarkNotificationCubit({
    required this.usecase,
  }) : super(MarkNotificationState.initial());

  bool hasMoreItems = true;
  int currentPage = 1;

  Future<void> readNotification({
    required BuildContext context,
    required MarkReadNotificationRequestEntity entity,
  }) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await usecase(entity: entity);

    if (isClosed) return;
    result.fold(
      (failure) async {
        final ErrorEntity errorEntity = await ApiErrorHandler.mapFailure(
            failure: failure, buildContext: context);
        emit(state.copyWith(
            error: errorEntity.errorMessage, status: CubitStatus.error));
      },
      (data) {

        emit(state.copyWith(
            status: CubitStatus.success,
            entity: data));
      },
    );
  }

}
