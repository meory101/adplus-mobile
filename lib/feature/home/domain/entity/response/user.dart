import 'dart:convert';

/// client_follower_id : 21
/// follower_id : 129
/// following_id : 2
/// created_at : "2024-11-09 18:40:38"
/// update_at : "2024-11-09 18:40:38"
/// following : {"client_id":2,"name":"tammam","username":"tammam.m888832@gmail.com","email":"tammam.m82@gmail.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    num? clientFollowerId,
    num? followerId,
    num? followingId,
    String? createdAt,
    String? updateAt,
    Following? following,
  }) {
    _clientFollowerId = clientFollowerId;
    _followerId = followerId;
    _followingId = followingId;
    _createdAt = createdAt;
    _updateAt = updateAt;
    _following = following;
  }

  User.fromJson(dynamic json) {

    _clientFollowerId = json['client_follower_id'];
    _followerId = json['follower_id'];
    _followingId = json['following_id'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
    if(json['follower']!=null){
      _following =Following.fromJson( json['follower'] );
    }
    if(json['following']!=null){
      _following =Following.fromJson( json['following'] );

    }
  }

  num? _clientFollowerId;
  num? _followerId;
  num? _followingId;
  String? _createdAt;
  String? _updateAt;
  Following? _following;

  User copyWith({
    num? clientFollowerId,
    num? followerId,
    num? followingId,
    String? createdAt,
    String? updateAt,
    Following? following,
  }) =>
      User(
        clientFollowerId: clientFollowerId ?? _clientFollowerId,
        followerId: followerId ?? _followerId,
        followingId: followingId ?? _followingId,
        createdAt: createdAt ?? _createdAt,
        updateAt: updateAt ?? _updateAt,
        following: following ?? _following,
      );

  num? get clientFollowerId => _clientFollowerId;

  num? get followerId => _followerId;

  num? get followingId => _followingId;

  String? get createdAt => _createdAt;

  String? get updateAt => _updateAt;

  Following? get following => _following;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_follower_id'] = _clientFollowerId;
    map['follower_id'] = _followerId;
    map['following_id'] = _followingId;
    map['created_at'] = _createdAt;
    map['update_at'] = _updateAt;
    if (_following != null) {
      map['following'] = _following?.toJson();
    }
    return map;
  }
}

/// client_id : 2
/// name : "tammam"
/// username : "tammam.m888832@gmail.com"
/// email : "tammam.m82@gmail.com"
/// phone : null
/// whatsapp : null
/// address : null
/// description : null
/// photo : null
/// token_expires : 0
/// is_verified : 1
/// error_login : 0

Following followingFromJson(String str) => Following.fromJson(json.decode(str));

String followingToJson(Following data) => json.encode(data.toJson());

class Following {
  Following({
    num? clientId,
    String? name,
    String? username,
    String? email,
    dynamic phone,
    dynamic whatsapp,
    dynamic address,
    dynamic description,
    dynamic photo,
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

  Following.fromJson(dynamic json) {
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
  String? _email;
  dynamic _phone;
  dynamic _whatsapp;
  dynamic _address;
  dynamic _description;
  dynamic _photo;
  num? _tokenExpires;
  num? _isVerified;
  num? _errorLogin;

  Following copyWith({
    num? clientId,
    String? name,
    String? username,
    String? email,
    dynamic phone,
    dynamic whatsapp,
    dynamic address,
    dynamic description,
    dynamic photo,
    num? tokenExpires,
    num? isVerified,
    num? errorLogin,
  }) =>
      Following(
        clientId: clientId ?? _clientId,
        name: name ?? _name,
        username: username ?? _username,
        email: email ?? _email,
        phone: phone ?? _phone,
        whatsapp: whatsapp ?? _whatsapp,
        address: address ?? _address,
        description: description ?? _description,
        photo: photo ?? _photo,
        tokenExpires: tokenExpires ?? _tokenExpires,
        isVerified: isVerified ?? _isVerified,
        errorLogin: errorLogin ?? _errorLogin,
      );

  num? get clientId => _clientId;

  String? get name => _name;

  String? get username => _username;

  String? get email => _email;

  dynamic get phone => _phone;

  dynamic get whatsapp => _whatsapp;

  dynamic get address => _address;

  dynamic get description => _description;

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
    map['description'] = _description;
    map['photo'] = _photo;
    map['token_expires'] = _tokenExpires;
    map['is_verified'] = _isVerified;
    map['error_login'] = _errorLogin;
    return map;
  }
}
