import 'dart:convert';

// دوال للتحويل بين JSON وكائنات الدارت
MyItemResponseEntity myItemResponseEntityFromJson(String str) =>
    MyItemResponseEntity.fromJson(json.decode(str));
String myItemResponseEntityToJson(MyItemResponseEntity data) =>
    json.encode(data.toJson());

class MyItemResponseEntity {
  MyItemResponseEntity({
    bool? success,
    String? message,
    Data? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  MyItemResponseEntity.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  Data({
    List<Item>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  List<Item>? _data;
  Pagination? _pagination;

  List<Item>? get data => _data;
  Pagination? get pagination => _pagination;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Item.fromJson(v));
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

class Item {
  Item({
    num? categoryId,
    num? cityId,
    String? name,
    num? biddingStatus,
    List<Photo>? photos,
    List<Comment>? comments,
    List<Reaction>? reactions,
    List<Author>? author,
    String? description,
    String? keywords,
    num? startingPrice,
    List<Attribute>? attributes,
  }) {
    _categoryId = categoryId;
    _cityId = cityId;
    _name = name;
    _biddingStatus = biddingStatus;
    _photos = photos;
    _comments = comments;
    _reactions = reactions;
    _author = author;
    _description = description;
    _keywords = keywords;
    _startingPrice = startingPrice;
    _attributes = attributes;
  }

  num? _categoryId;
  num? _cityId;
  String? _name;
  num? _biddingStatus;
  List<Photo>? _photos;
  List<Comment>? _comments;
  List<Reaction>? _reactions;
  List<Author>? _author;
  String? _description;
  String? _keywords;
  num? _startingPrice;
  List<Attribute>? _attributes;

  num? get categoryId => _categoryId;
  num? get cityId => _cityId;
  String? get name => _name;
  num? get biddingStatus => _biddingStatus;
  List<Photo>? get photos => _photos;
  List<Comment>? get comments => _comments;
  List<Reaction>? get reactions => _reactions;
  List<Author>? get author => _author;
  String? get description => _description;
  String? get keywords => _keywords;
  num? get startingPrice => _startingPrice;
  List<Attribute>? get attributes => _attributes;

  Item.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _biddingStatus = json['bidding_status'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photo.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comment.fromJson(v));
      });
    }
    if (json['reactions'] != null) {
      _reactions = [];
      json['reactions'].forEach((v) {
        _reactions?.add(Reaction.fromJson(v));
      });
    }
    if (json['author'] != null && json['author'] is List) {
      _author = List<Author>.from(
        (json['author'] as List).map((x) => Author.fromJson(x)),
      );
    }

    _description = json['description'];
    _keywords = json['keywords'];
    _startingPrice = json['starting_price'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attribute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['city_id'] = _cityId;
    map['name'] = _name;
    map['bidding_status'] = _biddingStatus;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    if (_reactions != null) {
      map['reactions'] = _reactions?.map((v) => v.toJson()).toList();
    }
    if (_author != null) {
      map['author'] = _author?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['starting_price'] = _startingPrice;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
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
  Author(
      {num? clientId,
      String? name,
      String? email,
      String? phone,
      String? address,
      String? photo}) {
    _clientId = clientId;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    _photo = photo;
  }

  num? _clientId;
  String? _name;
  String? _email;
  String? _phone;
  String? _address;
  String? _photo;

  num? get clientId => _clientId;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get photo => _photo;

  Author.fromJson(Map<String, dynamic> json) {
    _clientId = json['client_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _photo = json['photo'];
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
