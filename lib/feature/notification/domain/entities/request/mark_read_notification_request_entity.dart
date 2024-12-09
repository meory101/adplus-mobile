import 'dart:convert';
/// notification_id : 0

MarkReadNotificationRequestEntity markReadNotificationRequestEntityFromJson(String str) => MarkReadNotificationRequestEntity.fromJson(json.decode(str));
String markReadNotificationRequestEntityToJson(MarkReadNotificationRequestEntity data) => json.encode(data.toJson());
class MarkReadNotificationRequestEntity {
  MarkReadNotificationRequestEntity({
      num? notificationId,}){
    _notificationId = notificationId;
}

  MarkReadNotificationRequestEntity.fromJson(dynamic json) {
    _notificationId = json['notification_id'];
  }
  num? _notificationId;
MarkReadNotificationRequestEntity copyWith({  num? notificationId,
}) => MarkReadNotificationRequestEntity(  notificationId: notificationId ?? _notificationId,
);
  num? get notificationId => _notificationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification_id'] = _notificationId;
    return map;
  }

}