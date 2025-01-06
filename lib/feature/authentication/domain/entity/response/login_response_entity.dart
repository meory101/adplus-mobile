import 'dart:convert';

import '../../../../../core/model/user.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"user":{"client_id":107,"name":"Murad","username":"+963999999999","email":null,"phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},"is_verified":true,"captcha":false,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tYXphZGRpbWFzaHEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI5ODgyMzA2LCJleHAiOjE3Mjk4ODU5MDYsIm5iZiI6MTcyOTg4MjMwNiwianRpIjoiYjhDZFFPWE5PY2I5R3c3ZCIsInN1YiI6IjEwNyIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.ry65Hs2wWY4b-pz_VriHo_9j9GzE-OVr-n0jMvo8FFI","expires_in":3600}
/// errors : []

LoginResponseEntity loginResponseEntityFromJson(String str) => LoginResponseEntity.fromJson(json.decode(str));
String loginResponseEntityToJson(LoginResponseEntity data) => json.encode(data.toJson());
class LoginResponseEntity {
  LoginResponseEntity({
      bool? success, 
      String? message, 
      UserLoginData? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  LoginResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? UserLoginData.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  UserLoginData? _data;
  List<dynamic>? _errors;
LoginResponseEntity copyWith({  bool? success,
  String? message,
  UserLoginData? data,
  List<dynamic>? errors,
}) => LoginResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  UserLoginData? get data => _data;
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

UserLoginData dataFromJson(String str) => UserLoginData.fromJson(json.decode(str));
String dataToJson(UserLoginData data) => json.encode(data.toJson());
class UserLoginData {
  UserLoginData({
      User? user, 
      bool? isVerified, 
      bool? captcha, 
      String? accessToken, 
      num? expiresIn,}){
    _user = user;
    _isVerified = isVerified;
    _captcha = captcha;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
}

  UserLoginData.fromJson(dynamic json) {
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
UserLoginData copyWith({  User? user,
  bool? isVerified,
  bool? captcha,
  String? accessToken,
  num? expiresIn,
}) => UserLoginData(  user: user ?? _user,
  isVerified: isVerified ?? _isVerified,
  captcha: captcha ?? _captcha,
  accessToken: accessToken ?? _accessToken,
  expiresIn: expiresIn ?? _expiresIn,
);
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


