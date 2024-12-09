import 'package:dartz/dartz.dart';

import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entities/request/mark_read_notification_request_entity.dart';
import '../../domain/entities/request/notifications_request_entity.dart';
import '../../domain/entities/response/notifications_response_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/remote/notification_remote.dart';

/// Eng.Nour Othman(meory)*


class NotificationRepoImpl implements NotificationRepository {
  final NotificationRemote remote;

  NotificationRepoImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, NotificationsResponseEntity>> getNotification({required NotificationsRequestEntity entity}) {
    return Connector<NotificationsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getNotification(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> markAsRead({required MarkReadNotificationRequestEntity entity})async {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.markAsRead(entity: entity);
        return Right(result);
      },
    );
  }
}
