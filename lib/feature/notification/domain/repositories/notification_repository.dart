import 'package:dartz/dartz.dart';

import '../../../../core/api/api_error/api_failures.dart';
import '../entities/request/notifications_request_entity.dart';
import '../entities/response/notifications_response_entity.dart';


/// Eng.Nour Othman(meory)*


abstract class NotificationRepository {
  Future<Either<ApiFailure, NotificationsResponseEntity>> getNotification({required NotificationsRequestEntity entity});
}
