import 'dart:convert';

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
    ProfileUser? user,
    bool? isVerified,
    bool? captcha,
  }) {
    _user = user;
    _isVerified = isVerified;
    _captcha = captcha;
  }

  ProfileByUsernameData.fromJson(dynamic json) {
    _user = json['user'] != null ? ProfileUser.fromJson(json['user']) : null;
    _isVerified = json['is_verified'];
    _captcha = json['captcha'];
  }

  ProfileUser? _user;
  bool? _isVerified;
  bool? _captcha;

  ProfileUser? get user => _user;
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

class ProfileUser {
  ProfileUser({
    num? clientId,
    String? name,
    String? username,
    dynamic email,
    dynamic phone,
    dynamic whatsapp,
    dynamic address,
    String? description,
    String? photo,
    num? tokenExpires,
    num? isVerified,
    num? errorLogin,
  }) {
    _clientId = clientId;
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _whatsapp = whatsapp;
    _address = address;
    _description = description;
    _photo = photo;
    _tokenExpires = tokenExpires;
    _isVerified = isVerified;
    _errorLogin = errorLogin;
  }

  ProfileUser.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _whatsapp = json['whatsapp'];
    _address = json['address'];
    _description = json['description'];
    _photo = json['photo'];
    _tokenExpires = json['token_expires'];
    _isVerified = json['is_verified'];
    _errorLogin = json['error_login'];
  }

  num? _clientId;
  String? _name;
  String? _username;
  dynamic _email;
  dynamic _phone;
  dynamic _whatsapp;
  dynamic _address;
  String? _description;
  String? _photo;
  num? _tokenExpires;
  num? _isVerified;
  num? _errorLogin;

  num? get clientId => _clientId;
  String? get name => _name;
  String? get username => _username;
  dynamic get email => _email;
  dynamic get phone => _phone;
  dynamic get whatsapp => _whatsapp;
  dynamic get address => _address;
  String? get description => _description;
  String? get photo => _photo;
  num? get tokenExpires => _tokenExpires;
  num? get isVerified => _isVerified;
  num? get errorLogin => _errorLogin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['whatsapp'] = _whatsapp;
    map['address'] = _address;
    map['description'] = _description;
    map['photo'] = _photo;
    map['token_expires'] = _tokenExpires;
    map['is_verified'] = _isVerified;
    map['error_login'] = _errorLogin;
    return map;
  }
}