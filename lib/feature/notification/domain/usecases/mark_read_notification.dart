import 'package:dartz/dartz.dart';

import '../../../../core/api/api_error/api_failures.dart';
import '../entities/request/mark_read_notification_request_entity.dart';
import '../repositories/notification_repository.dart';

/// Eng.Nour Othman(meory)*

class MarkReadNotification {
  final NotificationRepository repository;

  MarkReadNotification({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call(
      {required MarkReadNotificationRequestEntity entity}) {
    return repository.markAsRead(entity: entity);
  }
}

class NotificationRequestEntity {}
