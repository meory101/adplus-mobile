import 'dart:convert';


import 'package:mzad_damascus/feature/home/domain/entity/response/user.dart';

import '../../../../../core/model/pagination.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"client_follower_id":17,"follower_id":129,"following_id":107,"created_at":"2024-11-09 11:18:03","update_at":"2024-11-09 11:18:03","following":{"client_id":107,"name":"nour","username":"othmannour2004@gmail.com","email":"othmannour2004@gmail.com","phone":"+963999999999","whatsapp":"0991338394","address":null,"description":null,"photo":"1730086284_671f058cbfbaf.webp","token_expires":0,"is_verified":0,"error_login":0}},{"client_follower_id":18,"follower_id":129,"following_id":135,"created_at":"2024-11-09 12:13:08","update_at":"2024-11-09 12:13:08","following":{"client_id":135,"name":"Hussaen","username":"meorysona@gmail.com","email":null,"phone":null,"whatsapp":null,"address":null,"description":"hello","photo":"1731060760_672de4182a93b.webp","token_expires":0,"is_verified":1,"error_login":0}},{"client_follower_id":21,"follower_id":129,"following_id":2,"created_at":"2024-11-09 18:40:38","update_at":"2024-11-09 18:40:38","following":{"client_id":2,"name":"tammam","username":"tammam.m888832@gmail.com","email":"tammam.m82@gmail.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0}}],"pagination":{"total_items":3,"total_pages":1,"current_page":1,"per_page":10}}
/// errors : []

FollowersResponseEntity followersResponseEntityFromJson(String str) => FollowersResponseEntity.fromJson(json.decode(str));
String followersResponseEntityToJson(FollowersResponseEntity data) => json.encode(data.toJson());
class FollowersResponseEntity {
  FollowersResponseEntity({
      bool? success, 
      String? message, 
      Data? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  FollowersResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  Data? _data;
  List<dynamic>? _errors;
FollowersResponseEntity copyWith({  bool? success,
  String? message,
  Data? data,
  List<dynamic>? errors,
}) => FollowersResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
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

/// data : [{"client_follower_id":17,"follower_id":129,"following_id":107,"created_at":"2024-11-09 11:18:03","update_at":"2024-11-09 11:18:03","following":{"client_id":107,"name":"nour","username":"othmannour2004@gmail.com","email":"othmannour2004@gmail.com","phone":"+963999999999","whatsapp":"0991338394","address":null,"description":null,"photo":"1730086284_671f058cbfbaf.webp","token_expires":0,"is_verified":0,"error_login":0}},{"client_follower_id":18,"follower_id":129,"following_id":135,"created_at":"2024-11-09 12:13:08","update_at":"2024-11-09 12:13:08","following":{"client_id":135,"name":"Hussaen","username":"meorysona@gmail.com","email":null,"phone":null,"whatsapp":null,"address":null,"description":"hello","photo":"1731060760_672de4182a93b.webp","token_expires":0,"is_verified":1,"error_login":0}},{"client_follower_id":21,"follower_id":129,"following_id":2,"created_at":"2024-11-09 18:40:38","update_at":"2024-11-09 18:40:38","following":{"client_id":2,"name":"tammam","username":"tammam.m888832@gmail.com","email":"tammam.m82@gmail.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0}}]
/// pagination : {"total_items":3,"total_pages":1,"current_page":1,"per_page":10}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<User>? data,
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(User.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<User>? _data;
  Pagination? _pagination;
Data copyWith({  List<User>? data,
  Pagination? pagination,
}) => Data(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<User>? get data => _data;
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
