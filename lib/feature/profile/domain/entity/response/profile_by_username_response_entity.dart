import 'dart:convert';

import 'package:mzad_damascus/core/model/user.dart';

ProfileByUsernameResponseEntity profileByUsernameResponseEntityFromJson(String str) =>
    ProfileByUsernameResponseEntity.fromJson(json.decode(str));

String profileByUsernameResponseEntityToJson(ProfileByUsernameResponseEntity data) =>
    json.encode(data.toJson());

class ProfileByUsernameResponseEntity {
  ProfileByUsernameResponseEntity({
    bool? success,
    String? message,
    ProfileByUsernameData? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  ProfileByUsernameResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null
        ? ProfileByUsernameData.fromJson(json['data'])
        : null;
    _errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : null;
  }

  bool? _success;
  String? _message;
  ProfileByUsernameData? _data;
  List<dynamic>? _errors;

  bool? get success => _success;
  String? get message => _message;
  ProfileByUsernameData? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }
}

class ProfileByUsernameData {
  ProfileByUsernameData({
    User? user,
    bool? isVerified,
    bool? captcha,
  }) {
    _user = user;
    _isVerified = isVerified;
    _captcha = captcha;
  }

  ProfileByUsernameData.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _isVerified = json['is_verified'];
    _captcha = json['captcha'];
  }

  User? _user;
  bool? _isVerified;
  bool? _captcha;

  User? get user => _user;
  bool? get isVerified => _isVerified;
  bool? get captcha => _captcha;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['is_verified'] = _isVerified;
    map['captcha'] = _captcha;
    return map;
  }
}

