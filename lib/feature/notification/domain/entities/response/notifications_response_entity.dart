import 'dart:convert';

import '../../../../../core/model/pagination.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"notification_id":4103,"client_id":129,"item_id":103,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-07 08:31:47","update_at":"2024-12-07 08:31:47"},{"notification_id":4100,"client_id":129,"item_id":122,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-06 17:07:02","update_at":"2024-12-06 17:07:02"},{"notification_id":4099,"client_id":129,"item_id":122,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-06 17:06:59","update_at":"2024-12-06 17:06:59"},{"notification_id":4086,"client_id":129,"item_id":103,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-11-26 06:02:35","update_at":"2024-11-26 06:02:36"},{"notification_id":4081,"client_id":129,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:50","update_at":"2024-11-26 05:52:50"},{"notification_id":4076,"client_id":129,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:35","update_at":"2024-11-26 05:52:35"},{"notification_id":4071,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:22","update_at":"2024-11-26 05:52:22"},{"notification_id":4056,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:27","update_at":"2024-11-25 20:17:27"},{"notification_id":4051,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:09","update_at":"2024-11-25 20:17:09"},{"notification_id":4046,"client_id":129,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:58","update_at":"2024-11-25 20:16:58"}],"pagination":{"total_items":75,"total_pages":8,"current_page":1,"per_page":10}}
/// errors : []

NotificationsResponseEntity notificationsResponseEntityFromJson(String str) => NotificationsResponseEntity.fromJson(json.decode(str));
String notificationsResponseEntityToJson(NotificationsResponseEntity data) => json.encode(data.toJson());
class NotificationsResponseEntity {
  NotificationsResponseEntity({
      bool? success, 
      String? message, 
      NotificationData? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  NotificationsResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? NotificationData.fromJson(json['data']) : null;

  }
  bool? _success;
  String? _message;
  NotificationData? _data;
  List<dynamic>? _errors;
NotificationsResponseEntity copyWith({  bool? success,
  String? message,
  NotificationData? data,
  List<dynamic>? errors,
}) => NotificationsResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  NotificationData? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// data : [{"notification_id":4103,"client_id":129,"item_id":103,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-07 08:31:47","update_at":"2024-12-07 08:31:47"},{"notification_id":4100,"client_id":129,"item_id":122,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-06 17:07:02","update_at":"2024-12-06 17:07:02"},{"notification_id":4099,"client_id":129,"item_id":122,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-06 17:06:59","update_at":"2024-12-06 17:06:59"},{"notification_id":4086,"client_id":129,"item_id":103,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-11-26 06:02:35","update_at":"2024-11-26 06:02:36"},{"notification_id":4081,"client_id":129,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:50","update_at":"2024-11-26 05:52:50"},{"notification_id":4076,"client_id":129,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:35","update_at":"2024-11-26 05:52:35"},{"notification_id":4071,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:22","update_at":"2024-11-26 05:52:22"},{"notification_id":4056,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:27","update_at":"2024-11-25 20:17:27"},{"notification_id":4051,"client_id":129,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:09","update_at":"2024-11-25 20:17:09"},{"notification_id":4046,"client_id":129,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:58","update_at":"2024-11-25 20:16:58"}]
/// pagination : {"total_items":75,"total_pages":8,"current_page":1,"per_page":10}

NotificationData dataFromJson(String str) => NotificationData.fromJson(json.decode(str));
String dataToJson(NotificationData data) => json.encode(data.toJson());
class NotificationData {
  NotificationData({
      List<NotificationItem>? data,
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  NotificationData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NotificationItem.fromJson(v));
      });
    }

    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;

  print(_pagination?.totalItems);
  }
  List<NotificationItem>? _data;
  Pagination? _pagination;
NotificationData copyWith({  List<NotificationItem>? data,
  Pagination? pagination,
}) => NotificationData(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<NotificationItem>? get data => _data;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}

NotificationItem notificationFromJson(String str) => NotificationItem.fromJson(json.decode(str));
String notificationToJson(NotificationData data) => json.encode(data.toJson());
class NotificationItem {
  NotificationData({
      num? notificationId, 
      num? clientId, 
      num? itemId, 
      String? message, 
      num? isRead, 
      String? createdAt, 
      String? updateAt,}){
    _notificationId = notificationId;
    _clientId = clientId;
    _itemId = itemId;
    _message = message;
    _isRead = isRead;
    _createdAt = createdAt;
    _updateAt = updateAt;
}

  NotificationItem.fromJson(dynamic json) {
    _notificationId = json['notification_id'];
    _clientId = json['client_id'];
    _itemId = json['item_id'];
    _message = json['message'];
    _isRead = json['is_read'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
  }
  num? _notificationId;
  num? _clientId;
  num? _itemId;
  String? _message;
  num? _isRead;
  String? _createdAt;
  String? _updateAt;
  NotificationItem copyWith({  num? notificationId,
  num? clientId,
  num? itemId,
  String? message,
  num? isRead,
  String? createdAt,
  String? updateAt,
}) => NotificationData(  notificationId: notificationId ?? _notificationId,
  clientId: clientId ?? _clientId,
  itemId: itemId ?? _itemId,
  message: message ?? _message,
  isRead: isRead ?? _isRead,
  createdAt: createdAt ?? _createdAt,
  updateAt: updateAt ?? _updateAt,
);
  num? get notificationId => _notificationId;
  num? get clientId => _clientId;
  num? get itemId => _itemId;
  String? get message => _message;
  num? get isRead => _isRead;
  String? get createdAt => _createdAt;
  String? get updateAt => _updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification_id'] = _notificationId;
    map['client_id'] = _clientId;
    map['item_id'] = _itemId;
    map['message'] = _message;
    map['is_read'] = _isRead;
    map['created_at'] = _createdAt;
    map['update_at'] = _updateAt;
    return map;
  }

}