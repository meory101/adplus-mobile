import 'dart:convert';

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
  }) => Data(
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

/// client_id : 107
/// name : "Murad"
/// username : "+963999999999"
/// email : "othaaaaaaaaa@gmail.com"
/// phone : "+963999999999"
/// whatsapp : "963999999999"
/// address : null
/// photo : null
/// token_expires : 0
/// is_verified : 1
/// error_login : 0
/// description : "User description"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    num? clientId,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? whatsapp,
    dynamic address,
    dynamic photo,
    num? tokenExpires,
    num? isVerified,
    num? errorLogin,
    String? description, // New field
  }) {
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
    _description = description; // Assign new field
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
    _description = json['description']; // Parse new field
  }

  num? _clientId;
  String? _name;
  String? _username;
  String? _email;
  String? _phone;
  String? _whatsapp;
  dynamic _address;
  dynamic _photo;
  num? _tokenExpires;
  num? _isVerified;
  num? _errorLogin;
  String? _description; // New field

  User copyWith({
    num? clientId,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? whatsapp,
    dynamic address,
    dynamic photo,
    num? tokenExpires,
    num? isVerified,
    num? errorLogin,
    String? description, // New field
  }) => User(
    clientId: clientId ?? _clientId,
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
    description: description ?? _description, // Assign new field
  );

  num? get clientId => _clientId;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  String? get whatsapp => _whatsapp;
  dynamic get address => _address;
  dynamic get photo => _photo;
  num? get tokenExpires => _tokenExpires;
  num? get isVerified => _isVerified;
  num? get errorLogin => _errorLogin;
  String? get description => _description; // New getter

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
    map['description'] = _description; // Add to JSON
    return map;
  }
}
