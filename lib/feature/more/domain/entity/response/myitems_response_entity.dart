import 'dart:convert';

import '../../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';

 MyItemResponseEntity myItemResponseEntityFromJson(String str) =>
    MyItemResponseEntity.fromJson(json.decode(str));
String myItemResponseEntityToJson(MyItemResponseEntity data) =>
    json.encode(data.toJson());

class MyItemResponseEntity {
  MyItemResponseEntity({
    bool? success,
    String? message,
    MyAdvsData? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  bool? _success;
  String? _message;
  MyAdvsData? _data;

  bool? get success => _success;
  String? get message => _message;
  MyAdvsData? get data => _data;

  MyItemResponseEntity.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? MyAdvsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class MyAdvsData {
  MyAdvsData({
    List<AdData>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  List<AdData>? _data;
  Pagination? _pagination;

  List<AdData>? get data => _data;
  Pagination? get pagination => _pagination;

  MyAdvsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AdData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

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


class Photo {
  Photo({num? imageId, String? photo}) {
    _imageId = imageId;
    _photo = photo;
  }

  num? _imageId;
  String? _photo;

  num? get imageId => _imageId;
  String? get photo => _photo;

  Photo.fromJson(Map<String, dynamic> json) {
    _imageId = json['image_id'];
    _photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_id'] = _imageId;
    map['photo'] = _photo;
    return map;
  }
}

class Comment {
  Comment(
      {num? commentId,
      num? clientId,
      num? itemId,
      String? comment,
      String? createdAt}) {
    _commentId = commentId;
    _clientId = clientId;
    _itemId = itemId;
    _comment = comment;
    _createdAt = createdAt;
  }

  num? _commentId;
  num? _clientId;
  num? _itemId;
  String? _comment;
  String? _createdAt;

  num? get commentId => _commentId;
  num? get clientId => _clientId;
  num? get itemId => _itemId;
  String? get comment => _comment;
  String? get createdAt => _createdAt;

  Comment.fromJson(Map<String, dynamic> json) {
    _commentId = json['comment_id'];
    _clientId = json['client_id'];
    _itemId = json['item_id'];
    _comment = json['comment'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment_id'] = _commentId;
    map['client_id'] = _clientId;
    map['item_id'] = _itemId;
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    return map;
  }
}

class Reaction {
  Reaction(
      {num? reactionId,
      String? reactionType,
      num? itemId,
      num? clientId,
      String? createdAt}) {
    _reactionId = reactionId;
    _reactionType = reactionType;
    _itemId = itemId;
    _clientId = clientId;
    _createdAt = createdAt;
  }

  num? _reactionId;
  String? _reactionType;
  num? _itemId;
  num? _clientId;
  String? _createdAt;

  num? get reactionId => _reactionId;
  String? get reactionType => _reactionType;
  num? get itemId => _itemId;
  num? get clientId => _clientId;
  String? get createdAt => _createdAt;

  Reaction.fromJson(Map<String, dynamic> json) {
    _reactionId = json['reaction_id'];
    _reactionType = json['reaction_type'];
    _itemId = json['item_id'];
    _clientId = json['client_id'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reaction_id'] = _reactionId;
    map['reaction_type'] = _reactionType;
    map['item_id'] = _itemId;
    map['client_id'] = _clientId;
    map['created_at'] = _createdAt;
    return map;
  }
}

class Author {
  Author({
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

  Author.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    map['photo'] = _photo;
    return map;
  }
}

class Attribute {
  Attribute({num? attributeId, String? value}) {
    _attributeId = attributeId;
    _value = value;
  }

  num? _attributeId;
  String? _value;

  Attribute.fromJson(Map<String, dynamic> json) {
    _attributeId = json['attribute_id'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['value'] = _value;
    return map;
  }
}

class Pagination {
  Pagination(
      {num? totalItems, num? totalPages, num? currentPage, num? perPage}) {
    _totalItems = totalItems;
    _totalPages = totalPages;
    _currentPage = currentPage;
    _perPage = perPage;
  }

  num? _totalItems;
  num? _totalPages;
  num? _currentPage;
  num? _perPage;

  num? get totalItems => _totalItems;
  num? get totalPages => _totalPages;
  num? get currentPage => _currentPage;
  num? get perPage => _perPage;

  Pagination.fromJson(Map<String, dynamic> json) {
    _totalItems = json['total_items'];
    _totalPages = json['total_pages'];
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {                                          
    final map = <String, dynamic>{};
    map['total_items'] = _totalItems;
    map['total_pages'] = _totalPages;
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    return map;
  }
}