import 'dart:convert';

import '../../../../../core/model/pagination.dart';
import '../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"notification_id":4088,"client_id":80,"item_id":145,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-04 09:36:10","update_at":"2024-12-04 09:36:10","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4085,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:50","update_at":"2024-11-26 05:52:50","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4080,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:35","update_at":"2024-11-26 05:52:35","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4075,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:22","update_at":"2024-11-26 05:52:22","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4060,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:27","update_at":"2024-11-25 20:17:27","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4055,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:09","update_at":"2024-11-25 20:17:09","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4050,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:58","update_at":"2024-11-25 20:16:58","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4045,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:40","update_at":"2024-11-25 20:16:40","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4040,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:35","update_at":"2024-11-25 20:16:35","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4035,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:11","update_at":"2024-11-25 20:16:11","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}}],"pagination":{"total_items":39,"total_pages":4,"current_page":1,"per_page":10}}
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

/// data : [{"notification_id":4088,"client_id":80,"item_id":145,"message":"تم التفاعل مع الاعلان من قبل احد المستخدمين","is_read":0,"created_at":"2024-12-04 09:36:10","update_at":"2024-12-04 09:36:10","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4085,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:50","update_at":"2024-11-26 05:52:50","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4080,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:35","update_at":"2024-11-26 05:52:35","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4075,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-26 05:52:22","update_at":"2024-11-26 05:52:22","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4060,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:27","update_at":"2024-11-25 20:17:27","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4055,"client_id":80,"item_id":146,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:17:09","update_at":"2024-11-25 20:17:09","item":{"item_id":146,"category_id":4,"city_id":2,"name":"أفضل سيارة هذا العام","starting_price":100,"type":null,"description":"Cyfcc7","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":179,"item_id":146,"photo":"1732565697_6744dac1a1e06.webp"}]}},{"notification_id":4050,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:58","update_at":"2024-11-25 20:16:58","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4045,"client_id":80,"item_id":144,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:40","update_at":"2024-11-25 20:16:40","item":{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}]}},{"notification_id":4040,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:35","update_at":"2024-11-25 20:16:35","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}},{"notification_id":4035,"client_id":80,"item_id":145,"message":"لقد تمت إضافة عنصر جديد في الفئة التي أبديت اهتمامك بها!","is_read":0,"created_at":"2024-11-25 20:16:11","update_at":"2024-11-25 20:16:11","item":{"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}}]
/// pagination : {"total_items":39,"total_pages":4,"current_page":1,"per_page":10}

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



/// notification_id : 4088
/// client_id : 80
/// item_id : 145
/// message : "تم التفاعل مع الاعلان من قبل احد المستخدمين"
/// is_read : 0
/// created_at : "2024-12-04 09:36:10"
/// update_at : "2024-12-04 09:36:10"
/// item : {"item_id":145,"category_id":4,"city_id":2,"name":"Ftggg yyyy tytt","starting_price":100,"type":null,"description":"Yyyy tttt tttyy","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":-1,"bidding_status":1,"homepage_appear":0,"ord":1,"photos":[{"image_id":209,"item_id":145,"photo":"1733590650_67547e7acf1cb.webp"}]}

NotificationItem notificationItemFromJson(String str) => NotificationItem.fromJson(json.decode(str));
String notificationItemToJson(NotificationData data) => json.encode(data.toJson());
class NotificationItem {
  NotificationItem({
      num? notificationId, 
      num? clientId, 
      num? itemId, 
      String? message, 
      num? isRead, 
      String? createdAt, 
      String? updateAt, 
      AdData? item,}){
    _notificationId = notificationId;
    _clientId = clientId;
    _itemId = itemId;
    _message = message;
    _isRead = isRead;
    _createdAt = createdAt;
    _updateAt = updateAt;
    _item = item;
}

  NotificationItem.fromJson(dynamic json) {
    _notificationId = json['notification_id'];
    _clientId = json['client_id'];
    _itemId = json['item_id'];
    _message = json['message'];
    _isRead = json['is_read'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
    _item = json['item'] != null ? AdData.fromJson(json['item']) : null;
  }
  num? _notificationId;
  num? _clientId;
  num? _itemId;
  String? _message;
  num? _isRead;
  String? _createdAt;
  String? _updateAt;
  AdData? _item;
NotificationItem copyWith({  num? notificationId,
  num? clientId,
  num? itemId,
  String? message,
  num? isRead,
  String? createdAt,
  String? updateAt,
  AdData? item,
}) => NotificationItem(  notificationId: notificationId ?? _notificationId,
  clientId: clientId ?? _clientId,
  itemId: itemId ?? _itemId,
  message: message ?? _message,
  isRead: isRead ?? _isRead,
  createdAt: createdAt ?? _createdAt,
  updateAt: updateAt ?? _updateAt,
  item: item ?? _item,
);
  num? get notificationId => _notificationId;
  num? get clientId => _clientId;
  num? get itemId => _itemId;
  String? get message => _message;
  num? get isRead => _isRead;
  String? get createdAt => _createdAt;
  String? get updateAt => _updateAt;
  AdData? get item => _item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notification_id'] = _notificationId;
    map['client_id'] = _clientId;
    map['item_id'] = _itemId;
    map['message'] = _message;
    map['is_read'] = _isRead;
    map['created_at'] = _createdAt;
    map['update_at'] = _updateAt;
    if (_item != null) {
      map['item'] = _item?.toJson();
    }
    return map;
  }

}

