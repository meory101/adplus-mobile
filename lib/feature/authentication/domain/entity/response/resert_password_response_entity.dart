import 'dart:convert';

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

class User {
  User({
    required this.clientId,
    required this.name,
    required this.username,
    this.email,
    required this.phone,
    required this.whatsapp,
    this.address,
    this.photo,
    required this.tokenExpires,
    required this.isVerified,
    required this.errorLogin,
  });

  User.fromJson(Map<String, dynamic> json)
      : clientId = json['client_id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        phone = json['phone'],
        whatsapp = json['whatsapp'],
        address = json['address'],
        photo = json['photo'],
        tokenExpires = json['token_expires'],
        isVerified = json['is_verified'],
        errorLogin = json['error_login'];

  final int clientId;
  final String name;
  final String username;
  final dynamic email; // Could be String? depending on your needs
  final String phone;
  final String whatsapp;
  final dynamic address; // Could be String? depending on your needs
  final dynamic photo; // Could be String? depending on your needs
  final int tokenExpires;
  final int isVerified;
  final int errorLogin;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['client_id'] = clientId;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['whatsapp'] = whatsapp;
    map['address'] = address;
    map['photo'] = photo;
    map['token_expires'] = tokenExpires;
    map['is_verified'] = isVerified;
    map['error_login'] = errorLogin;
    return map;
  }
}
