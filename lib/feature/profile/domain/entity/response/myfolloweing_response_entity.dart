import 'dart:convert';

MyFollowingResponseEntity myFollowingResponseEntityFromJson(String str) =>
    MyFollowingResponseEntity.fromJson(json.decode(str));

String myFollowingResponseEntityToJson(MyFollowingResponseEntity data) =>
    json.encode(data.toJson());

class MyFollowingResponseEntity {
  MyFollowingResponseEntity({
    bool? success,
    String? message,
    MyFollowingData? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  MyFollowingResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? MyFollowingData.fromJson(json['data']) : null;
    _errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : [];
  }

  bool? _success;
  String? _message;
  MyFollowingData? _data;
  List<dynamic>? _errors;

  bool? get success => _success;
  String? get message => _message;
  MyFollowingData? get data => _data;
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

class MyFollowingData {
  MyFollowingData({
    List<FollowingItem>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  MyFollowingData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(FollowingItem.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<FollowingItem>? _data;
  Pagination? _pagination;

  List<FollowingItem>? get data => _data;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}

class Pagination {
  Pagination({
    num? totalItems,
    num? totalPages,
    num? currentPage,
    num? perPage,
  }) {
    _totalItems = totalItems;
    _totalPages = totalPages;
    _currentPage = currentPage;
    _perPage = perPage;
  }

  Pagination.fromJson(dynamic json) {
    _totalItems = json['total_items'];
    _totalPages = json['total_pages'];
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
  }

  num? _totalItems;
  num? _totalPages;
  num? _currentPage;
  num? _perPage;

  num? get totalItems => _totalItems;
  num? get totalPages => _totalPages;
  num? get currentPage => _currentPage;
  num? get perPage => _perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_items'] = _totalItems;
    map['total_pages'] = _totalPages;
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    return map;
  }
}

class FollowingItem {
  FollowingItem({
    num? clientFollowerId,
    num? followerId,
    num? followingId,
    String? createdAt,
    String? updateAt,
    Follower? follower,
  }) {
    _clientFollowerId = clientFollowerId;
    _followerId = followerId;
    _followingId = followingId;
    _createdAt = createdAt;
    _updateAt = updateAt;
    _follower = follower;
  }

  FollowingItem.fromJson(dynamic json) {
    _clientFollowerId = json['client_follower_id'];
    _followerId = json['follower_id'];
    _followingId = json['following_id'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
    _follower =
        json['follower'] != null ? Follower.fromJson(json['follower']) : null;
  }

  num? _clientFollowerId;
  num? _followerId;
  num? _followingId;
  String? _createdAt;
  String? _updateAt;
  Follower? _follower;

  num? get clientFollowerId => _clientFollowerId;
  num? get followerId => _followerId;
  num? get followingId => _followingId;
  String? get createdAt => _createdAt;
  String? get updateAt => _updateAt;
  Follower? get follower => _follower;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_follower_id'] = _clientFollowerId;
    map['follower_id'] = _followerId;
    map['following_id'] = _followingId;
    map['created_at'] = _createdAt;
    map['update_at'] = _updateAt;
    if (_follower != null) {
      map['follower'] = _follower?.toJson();
    }
    return map;
  }
}

class Follower {
  Follower({
    num? clientId,
    String? name,
    String? username,
    dynamic email,
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

  Follower.fromJson(dynamic json) {
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
  dynamic _description;
  dynamic _photo;
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