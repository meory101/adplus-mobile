import 'dart:convert';

import '../../../../../core/model/user.dart';

ResetPasswordResponse resetPasswordResponseFromJson(String str) =>
    ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordResponseToJson(ResetPasswordResponse data) =>
    json.encode(data.toJson());

class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.message,
    required this.success,
    required this.errors,
    required this.data,
  });

  ResetPasswordResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        success = json['success'],
        errors = List<String>.from(json['errors']),
        data = json['data'] != null ? ResetPasswordData.fromJson(json['data']) : null;

  final String message;
  final bool success;
  final List<String> errors;
  final ResetPasswordData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['message'] = message;
    map['success'] = success;
    map['errors'] = errors;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class ResetPasswordData {
  ResetPasswordData({
    required this.user,
    required this.isVerified,
    required this.captcha,
    required this.accessToken,
    required this.expiresIn,
  });

  ResetPasswordData.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']),
        isVerified = json['is_verified'],
        captcha = json['captcha'],
        accessToken = json['access_token'],
        expiresIn = json['expires_in'];

  final User user;
  final bool isVerified;
  final bool captcha;
  final String accessToken;
  final int expiresIn;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['user'] = user.toJson();
    map['is_verified'] = isVerified;
    map['captcha'] = captcha;
    map['access_token'] = accessToken;
    map['expires_in'] = expiresIn;
    return map;
  }
}

