import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/feature/notification/domain/entities/response/notifications_response_entity.dart';
import 'package:mzad_damascus/feature/notification/domain/usecases/notification_usecase.dart';
import '../../../../../../core/api/api_error/api_error.dart';
import '../../../../../../core/resource/cubit_status_manager.dart';
import '../../../domain/entities/request/notifications_request_entity.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationUsecase usecase;

  NotificationCubit({
    required this.usecase,
  }) : super(NotificationState.initial());

  bool hasMoreItems = true;
  int currentPage = 1;

  Future<void> getMyNotifications({
    required BuildContext context,
    required NotificationsRequestEntity entity,
  }) async {
    if (!hasMoreItems ||
        state.status == CubitStatus.loading ||
        state.status == CubitStatus.loadMore) return;
    emit(state.copyWith(status: CubitStatus.loading));
    entity.page = currentPage;

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
        if ((data.data?.data ?? []).length < EnumManager.paginationLength) {
          hasMoreItems = false;
        } else {
          currentPage++;
        }

        List<NotificationItem>? existingItems = state.entity.data?.data ?? [];
        List<NotificationItem>? updatedItems = List.from(existingItems)
          ..addAll((data.data?.data ?? []).where((newItem) => !existingItems
              .any((existingItem) => existingItem.itemId == newItem.itemId)));
        emit(state.copyWith(
            status: CubitStatus.success,
            entity: NotificationsResponseEntity(
                data: NotificationData(data: updatedItems)),
            isReachedMax: !hasMoreItems));
      },
    );
  }

  void resetData() async {
    hasMoreItems = true;
    currentPage = 1;
  }
}
