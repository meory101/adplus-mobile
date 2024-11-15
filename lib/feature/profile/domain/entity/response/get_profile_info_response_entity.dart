import 'dart:convert';

import '../../../../../core/model/user.dart';

/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"user":{"client_id":107,"name":"Murad","username":"+963999999999","email":null,"phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0, "description": "User description"}}
/// errors : []

GetProfileInfoResponseEntity getProfileInfoResponseEntityFromJson(String str) =>
    GetProfileInfoResponseEntity.fromJson(json.decode(str));
String getProfileInfoResponseEntityToJson(GetProfileInfoResponseEntity data) =>
    json.encode(data.toJson());

class GetProfileInfoResponseEntity {
  GetProfileInfoResponseEntity({
    bool? success,
    String? message,
    ProfileInfo? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  GetProfileInfoResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? ProfileInfo.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  ProfileInfo? _data;
  List<dynamic>? _errors;

  GetProfileInfoResponseEntity copyWith({
    bool? success,
    String? message,
    ProfileInfo? data,
    List<dynamic>? errors,
  }) =>
      GetProfileInfoResponseEntity(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
        errors: errors ?? _errors,
      );

  bool? get success => _success;
  String? get message => _message;
  ProfileInfo? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors;
    }
    return map;
  }
}

/// user : {"client_id":107,"name":"Murad","username":"+963999999999","email":null,"phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0, "description": "User description"}

class   ProfileInfo {
  ProfileInfo({
    User? user,
    num? followersCount,
    num? followingCount,
    num? items,
  }) {
    _user = user;
    _items = items;
    _followersCount =followersCount ;
    _followingCount = followingCount;
  }

  ProfileInfo.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _items = json['items'];
    _followersCount = json['followers'];
    _followingCount =  json['following'];
  }

  User? _user;
  num? _followersCount;
  num? _followingCount;
  num? _items;

  ProfileInfo copyWith({
    User? user,
    num? followersCount,
    num? followingCount,
    num? items,
  }) =>
      ProfileInfo(
         followersCount: followersCount ?? _followersCount,
         followingCount: followingCount ?? _followingCount,
        items: items ?? _items,
        user: user ?? _user,
      );

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}


