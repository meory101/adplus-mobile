import 'dart:convert';
/// page : 1

NotificationsRequestEntity notificationsRequestEntityFromJson(String str) => NotificationsRequestEntity.fromJson(json.decode(str));
String notificationsRequestEntityToJson(NotificationsRequestEntity data) => json.encode(data.toJson());
class NotificationsRequestEntity {
  NotificationsRequestEntity({
      num? page,}){
    _page = page;
}

  NotificationsRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
NotificationsRequestEntity copyWith({  num? page,
}) => NotificationsRequestEntity(  page: page ?? _page,
);

  set page(num? value) {
    _page = value;
  }

  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}