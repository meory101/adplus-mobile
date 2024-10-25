import 'dart:convert';
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

/// user : {"client_id":107,"name":"Murad","username":"+963999999999","email":null,"phone":"+963999999999","whatsapp":"963999999999","address":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0}
/// is_verified : true
/// captcha : false
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tYXphZGRpbWFzaHEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI5ODgyMzA2LCJleHAiOjE3Mjk4ODU5MDYsIm5iZiI6MTcyOTg4MjMwNiwianRpIjoiYjhDZFFPWE5PY2I5R3c3ZCIsInN1YiI6IjEwNyIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.ry65Hs2wWY4b-pz_VriHo_9j9GzE-OVr-n0jMvo8FFI"
/// expires_in : 3600

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

/// client_id : 107
/// name : "Murad"
/// username : "+963999999999"
/// email : null
/// phone : "+963999999999"
/// whatsapp : "963999999999"
/// address : null
/// photo : null
/// token_expires : 0
/// is_verified : 1
/// error_login : 0

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      num? clientId, 
      String? name, 
      String? username, 
      dynamic email, 
      String? phone, 
      String? whatsapp, 
      dynamic address, 
      dynamic photo, 
      num? tokenExpires, 
      num? isVerified, 
      num? errorLogin,}){
    _clientId = clientId;
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _whatsapp = whatsapp;
    _address = address;
    _photo = photo;
    _tokenExpires = tokenExpires;
    _isVerified = isVerified;
    _errorLogin = errorLogin;
}

  User.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _whatsapp = json['whatsapp'];
    _address = json['address'];
    _photo = json['photo'];
    _tokenExpires = json['token_expires'];
    _isVerified = json['is_verified'];
    _errorLogin = json['error_login'];
  }
  num? _clientId;
  String? _name;
  String? _username;
  dynamic _email;
  String? _phone;
  String? _whatsapp;
  dynamic _address;
  dynamic _photo;
  num? _tokenExpires;
  num? _isVerified;
  num? _errorLogin;
User copyWith({  num? clientId,
  String? name,
  String? username,
  dynamic email,
  String? phone,
  String? whatsapp,
  dynamic address,
  dynamic photo,
  num? tokenExpires,
  num? isVerified,
  num? errorLogin,
}) => User(  clientId: clientId ?? _clientId,
  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  phone: phone ?? _phone,
  whatsapp: whatsapp ?? _whatsapp,
  address: address ?? _address,
  photo: photo ?? _photo,
  tokenExpires: tokenExpires ?? _tokenExpires,
  isVerified: isVerified ?? _isVerified,
  errorLogin: errorLogin ?? _errorLogin,
);
  num? get clientId => _clientId;
  String? get name => _name;
  String? get username => _username;
  dynamic get email => _email;
  String? get phone => _phone;
  String? get whatsapp => _whatsapp;
  dynamic get address => _address;
  dynamic get photo => _photo;
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
    map['photo'] = _photo;
    map['token_expires'] = _tokenExpires;
    map['is_verified'] = _isVerified;
    map['error_login'] = _errorLogin;
    return map;
  }

}