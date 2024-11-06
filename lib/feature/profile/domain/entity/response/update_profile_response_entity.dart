import 'dart:convert';

import '../../../../../core/model/user.dart';

/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"user":{"client_id":107,"name":"Murad","username":"+963999999999","email":"othaaaaaaaaa@gmail.com","phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0, "description": "User description"}}
/// errors : []

UpdateProfileResponseEntity updateProfileResponseEntityFromJson(String str) => UpdateProfileResponseEntity.fromJson(json.decode(str));
String updateProfileResponseEntityToJson(UpdateProfileResponseEntity data) => json.encode(data.toJson());

class UpdateProfileResponseEntity {
  UpdateProfileResponseEntity({
    bool? success,
    String? message,
    Data? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  UpdateProfileResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _success;
  String? _message;
  Data? _data;
  List<dynamic>? _errors;

  UpdateProfileResponseEntity copyWith({
    bool? success,
    String? message,
    Data? data,
    List<dynamic>? errors,
  }) => UpdateProfileResponseEntity(
    success: success ?? _success,
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
      map['errors'] = _errors;
    }
    return map;
  }
}

/// user : {"client_id":107,"name":"Murad","username":"+963999999999","email":"othaaaaaaaaa@gmail.com","phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0, "description": "User description"}

class Data {
  Data({
    User? user,
  }) {
    _user = user;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  User? _user;

  Data copyWith({
    User? user,
  }) =>
      Data(
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