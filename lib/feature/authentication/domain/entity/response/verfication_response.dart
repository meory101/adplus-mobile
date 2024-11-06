import 'dart:convert';

import '../../../../../core/model/user.dart';

/// تمثيل كيان استجابة التحقق VerificationResponseEntity
/// يحتوي على الحقول success و message و data و errors

VerificationResponseEntity verificationResponseEntityFromJson(String str) =>
    VerificationResponseEntity.fromJson(json.decode(str));

String verificationResponseEntityToJson(VerificationResponseEntity data) =>
    json.encode(data.toJson());

class VerificationResponseEntity {
  VerificationResponseEntity({
    bool? success,
    String? message,
    UserVerificationData? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  VerificationResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null
        ? UserVerificationData.fromJson(json['data'])
        : null;
    _errors =
        json['errors'] != null ? List<dynamic>.from(json['errors']) : null;
  }

  bool? _success;
  String? _message;
  UserVerificationData? _data;
  List<dynamic>? _errors;

  bool? get success => _success;
  String? get message => _message;
  UserVerificationData? get data => _data;
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

/// كيان UserVerificationData يحتوي على بيانات المستخدم وخصائص التحقق مثل is_verified و access_token و expires_in

class UserVerificationData {
  UserVerificationData({
    User? user,
    bool? isVerified,
    bool? captcha,
    String? accessToken,
    num? expiresIn,
  }) {
    _user = user;
    _isVerified = isVerified;
    _captcha = captcha;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
  }

  UserVerificationData.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _isVerified = json['is_verified'];
    _captcha = json['captcha'];
    _accessToken = json['access_token'];
    _expiresIn = json['expires_in'];
  }

  User? _user;
  bool? _isVerified;
  bool? _captcha;
  String? _accessToken;
  num? _expiresIn;

  User? get user => _user;
  bool? get isVerified => _isVerified;
  bool? get captcha => _captcha;
  String? get accessToken => _accessToken;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['is_verified'] = _isVerified;
    map['captcha'] = _captcha;
    map['access_token'] = _accessToken;
    map['expires_in'] = _expiresIn;
    return map;
  }
}

