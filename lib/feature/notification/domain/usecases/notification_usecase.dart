import 'package:dartz/dartz.dart';

import '../../../../core/api/api_error/api_failures.dart';
import '../entities/request/notifications_request_entity.dart';
import '../entities/response/notifications_response_entity.dart';
import '../repositories/notification_repository.dart';

/// Eng.Nour Othman(meory)*

class NotificationUsecase {
  final NotificationRepository repository;

  NotificationUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, NotificationsResponseEntity>> call(
      {required NotificationsRequestEntity entity}) {
    return repository.getNotification(entity: entity);
  }
}

class NotificationRequestEntity {}
