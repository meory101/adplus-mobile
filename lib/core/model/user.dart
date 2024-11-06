import 'dart:convert';

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
    String? description,
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
    _description = description;
  }

  User.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _name = json['name'];
    _username = json['username'];
    _description = json['description'];
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
  String? _description;
  User copyWith({  num? clientId,
    String? name,
    String? username,
    dynamic email,
    String? phone,
    String? whatsapp,
    dynamic address,
    dynamic photo,
    num? tokenExpires,
    String? description,
    num? isVerified,
    num? errorLogin,
  }) => User(  clientId: clientId ?? _clientId,
    name: name ?? _name,
    description: description ?? _description,
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
  String? get description => _description;
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