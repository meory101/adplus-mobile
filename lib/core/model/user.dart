import 'dart:convert';

/// client_id : 47
/// name : "hla"
/// username : "hla@gmail.com"
/// email : "hla@gmail.com"
/// phone : "+963978567888"
/// whatsapp : "+963978567888"
/// address : null
/// photo : "1729458413_671570ed9ea1e.webp"
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
    String? email,
    String? phone,
    String? whatsapp,
    String? decription,
    dynamic address,
    String? photo,
    num? tokenExpires,
    num? isVerified,
    num? followersCount,
    num? followingCount,
    num? errorLogin,
  }) {
    _clientId = clientId;
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _whatsapp = whatsapp;
    _address = address;
    _photo = photo;
    _description = description;
    _tokenExpires = tokenExpires;
    _isVerified = isVerified;
    _errorLogin = errorLogin;
  }

  User.fromJson(dynamic json) {
    _description = json['description'];
    _clientId = json['client_id'];
    _followersCount = json['follower_count'];
    _followingCount = json['following_count'];
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
  String? _email;
  String? _phone;
  String? _whatsapp;
  dynamic _address;
  String? _description;
  String? _photo;
  num? _tokenExpires;
  num? _isVerified;
  num? _followersCount;
  num? _followingCount;
  num? _errorLogin;

  User copyWith({
    num? clientId,
    String? name,
    String? username,
    String? email,
    String? description,
    String? phone,
    String? whatsapp,
    dynamic address,
    String? photo,
    num? followingCount,
    num? followersCount,

    num? tokenExpires,
    num? isVerified,
    num? errorLogin,
  }) =>
      User(
        decription: description ?? _description,
        clientId: clientId ?? _clientId,
        name: name ?? _name,
        username: username ?? _username,
        email: email ?? _email,
        phone: phone ?? _phone,
        whatsapp: whatsapp ?? _whatsapp,
        address: address ?? _address,
        photo: photo ?? _photo,
        followersCount: followersCount??_followersCount,
        followingCount: followingCount??_followingCount,
        tokenExpires: tokenExpires ?? _tokenExpires,
        isVerified: isVerified ?? _isVerified,
        errorLogin: errorLogin ?? _errorLogin,
      );

  num? get clientId => _clientId;
  String? get description => _description;

  String? get name => _name;

  String? get username => _username;
  num? get followersCount => _followersCount;
  num? get followingCount => _followingCount;

  String? get email => _email;

  String? get phone => _phone;

  String? get whatsapp => _whatsapp;

  dynamic get address => _address;

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
    map['photo'] = _photo;
    map['token_expires'] = _tokenExpires;
    map['is_verified'] = _isVerified;
    map['error_login'] = _errorLogin;
    return map;
  }
}