import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../domain/entities/request/notifications_request_entity.dart';
import '../../../domain/entities/response/notifications_response_entity.dart';

/// Eng.Nour Othman(meory)*


abstract class NotificationRemote {
  Future<NotificationsResponseEntity> getNotification({required NotificationsRequestEntity entity});
}

class NotificationRemoteImpl extends NotificationRemote {
  @override
  Future<NotificationsResponseEntity> getNotification({required NotificationsRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.getNotifications, body: entity.toJson());

    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return notificationsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
