import 'dart:convert';

import '../../../../../core/model/comment.dart';
import '../../../../../core/model/pagination.dart';
/// success : true
/// message : "Items retrieved successfully."
/// data : {"adData":[{"category_id":1,"city_id":1,"name":"Electronics","bidding_status":1,"photos":[{"image_id":1,"photo":"photo.jpg"}],"comments":[{"comment_id":101,"client_id":101,"item_id":45,"comment":"This is a great item!","created_at":"2024-09-16T12:00:00Z"}],"reactions":[{"reaction_id":501,"reaction_type":"like","item_id":45,"client_id":45,"created_at":"2024-09-16T12:00:00Z"}],"author":[{"client_id":501,"name":"string","email":"string","phone":"963999999999","address":"string","photo":"photo.jpg"}],"description":"Category description","keywords":"electronics, gadgets","starting_price":50000,"min_increase_price":10000,"bidding_start_time":"2024-10-01T12:00:00Z","attributes":[{"attribute_id":1,"value":"Black"}]}],"pagination":{"total_items":100,"total_pages":10,"current_page":1,"per_page":10}}

AdvsByAttributeResponseEntity advsByAttributeResponseEntityFromJson(String str) => AdvsByAttributeResponseEntity.fromJson(json.decode(str));
String advsByAttributeResponseEntityToJson(AdvsByAttributeResponseEntity data) => json.encode(data.toJson());
class AdvsByAttributeResponseEntity {
  AdvsByAttributeResponseEntity({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  AdvsByAttributeResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
AdvsByAttributeResponseEntity copyWith({  bool? success,
  String? message,
  Data? data,
}) => AdvsByAttributeResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

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

/// adData : [{"category_id":1,"city_id":1,"name":"Electronics","bidding_status":1,"photos":[{"image_id":1,"photo":"photo.jpg"}],"comments":[{"comment_id":101,"client_id":101,"item_id":45,"comment":"This is a great item!","created_at":"2024-09-16T12:00:00Z"}],"reactions":[{"reaction_id":501,"reaction_type":"like","item_id":45,"client_id":45,"created_at":"2024-09-16T12:00:00Z"}],"author":[{"client_id":501,"name":"string","email":"string","phone":"963999999999","address":"string","photo":"photo.jpg"}],"description":"Category description","keywords":"electronics, gadgets","starting_price":50000,"min_increase_price":10000,"bidding_start_time":"2024-10-01T12:00:00Z","attributes":[{"attribute_id":1,"value":"Black"}]}]
/// pagination : {"total_items":100,"total_pages":10,"current_page":1,"per_page":10}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    List<AdData>? adData,
    Pagination? pagination,}) {
    _adData = adData;
    _pagination = pagination;
  }

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _adData = [];
      json['data'].forEach((v) {
        _adData?.add(AdData.fromJson(v));
      });
    }
    _pagination =
    json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }

  List<AdData>? _adData;
  Pagination? _pagination;

  Data copyWith({ List<AdData>? adData,
    Pagination? pagination,
  }) =>
      Data(adData: adData ?? _adData,
        pagination: pagination ?? _pagination,
      );

  List<AdData>? get adData => _adData;

  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_adData != null) {
      map['adData'] = _adData?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}



AdData adDataFromJson(String str) => AdData.fromJson(json.decode(str));
String adDataToJson(AdData data) => json.encode(data.toJson());
class AdData {
  AdData({
      num? categoryId, 
      num? cityId, 
      String? name, 
      num? biddingStatus, 
      List<Photos>? photos, 
      List<Comment>? comments,
      List<Reactions>? reactions, 
      Author? author,
      String? description, 
      String? keywords, 
      num? startingPrice, 
      num? minIncreasePrice,
    num? itemId,
      String? biddingStartTime, 
      List<Attributes>? attributes,}){
    _categoryId = categoryId;
    _cityId = cityId;
    _name = name;
    _biddingStatus = biddingStatus;
    _photos = photos;
     _itemId = itemId;

        _comments = comments;
    _reactions = reactions;
    _author = author;
    _description = description;
    _keywords = keywords;
    _startingPrice = startingPrice;
    _minIncreasePrice = minIncreasePrice;
    _biddingStartTime = biddingStartTime;
    _attributes = attributes;
}

  AdData.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _biddingStatus = json['bidding_status'];
    _itemId = json['item_id'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
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
        _reactions?.add(Reactions.fromJson(v));
      });
    }
    if (json['author'] != null) {
        _author=(Author.fromJson(json['author']));
    }
    _description = json['description'];
    _keywords = json['keywords'];
    _startingPrice = json['starting_price'];
    _minIncreasePrice = json['min_increase_price'];
    _biddingStartTime = json['bidding_start_time'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
  }
  num? _categoryId;
  num? _cityId;
  String? _name;
  num? _biddingStatus;
  num? _itemId;
  List<Photos>? _photos;
  List<Comment>? _comments;
  List<Reactions>? _reactions;
  Author? _author;
  String? _description;
  String? _keywords;
  num? _startingPrice;
  num? _minIncreasePrice;
  String? _biddingStartTime;
  List<Attributes>? _attributes;
AdData copyWith({  num? categoryId,
  num? itemId,
  num? cityId,
  String? name,
  num? biddingStatus,
  List<Photos>? photos,
  List<Comment>? comments,
  List<Reactions>? reactions,
  Author? author,
  String? description,
  String? keywords,
  num? startingPrice,
  num? minIncreasePrice,
  String? biddingStartTime,
  List<Attributes>? attributes,
}) => AdData(  categoryId: categoryId ?? _categoryId,
  cityId: cityId ?? _cityId,

  itemId : _itemId ?? _itemId,
  name: name ?? _name,
  biddingStatus: biddingStatus ?? _biddingStatus,
  photos: photos ?? _photos,
  comments: comments ?? _comments,
  reactions: reactions ?? _reactions,
  author: author ?? _author,
  description: description ?? _description,
  keywords: keywords ?? _keywords,
  startingPrice: startingPrice ?? _startingPrice,
  minIncreasePrice: minIncreasePrice ?? _minIncreasePrice,
  biddingStartTime: biddingStartTime ?? _biddingStartTime,
  attributes: attributes ?? _attributes,
);
  num? get categoryId => _categoryId;
  num? get cityId => _cityId;
  String? get name => _name;
  num? get biddingStatus => _biddingStatus;
  List<Photos>? get photos => _photos;
  List<Comment>? get comments => _comments;
  List<Reactions>? get reactions => _reactions;
  Author? get author => _author;
  String? get description => _description;
  String? get keywords => _keywords;
  num? get startingPrice => _startingPrice;
  num? get minIncreasePrice => _minIncreasePrice;
  String? get biddingStartTime => _biddingStartTime;
  List<Attributes>? get attributes => _attributes;
 num? get     itemId => _itemId;

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
    // if (_author != null) {
    //   map['author'] = _author?.map((v) => v.toJson()).toList();
    // }
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['starting_price'] = _startingPrice;
    map['min_increase_price'] = _minIncreasePrice;
    map['bidding_start_time'] = _biddingStartTime;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// attribute_id : 1
/// value : "Black"

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      num? attributeId, 
      String? value,}){
    _attributeId = attributeId;
    _value = value;
}

  Attributes.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _value = json['value'];
  }
  num? _attributeId;
  String? _value;
Attributes copyWith({  num? attributeId,
  String? value,
}) => Attributes(  attributeId: attributeId ?? _attributeId,
  value: value ?? _value,
);
  num? get attributeId => _attributeId;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['value'] = _value;
    return map;
  }

}

/// client_id : 501
/// name : "string"
/// email : "string"
/// phone : "963999999999"
/// address : "string"
/// photo : "photo.jpg"

Author authorFromJson(String str) => Author.fromJson(json.decode(str));
String authorToJson(Author data) => json.encode(data.toJson());
class Author {
  Author({
      num? clientId, 
      String? name, 
      String? email, 
      String? phone, 
      String? address, 
      String? photo,}){
    _clientId = clientId;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    _photo = photo;
}

  Author.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _photo = json['photo'];
  }
  num? _clientId;
  String? _name;
  String? _email;
  String? _phone;
  String? _address;
  String? _photo;
Author copyWith({  num? clientId,
  String? name,
  String? email,
  String? phone,
  String? address,
  String? photo,
}) => Author(  clientId: clientId ?? _clientId,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  address: address ?? _address,
  photo: photo ?? _photo,
);
  num? get clientId => _clientId;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get photo => _photo;

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

/// reaction_id : 501
/// reaction_type : "like"
/// item_id : 45
/// client_id : 45
/// created_at : "2024-09-16T12:00:00Z"

Reactions reactionsFromJson(String str) => Reactions.fromJson(json.decode(str));
String reactionsToJson(Reactions data) => json.encode(data.toJson());
class Reactions {
  Reactions({
      num? reactionId, 
      String? reactionType, 
      num? itemId, 
      num? clientId, 
      String? createdAt,}){
    _reactionId = reactionId;
    _reactionType = reactionType;
    _itemId = itemId;
    _clientId = clientId;
    _createdAt = createdAt;
}

  Reactions.fromJson(dynamic json) {
    _reactionId = json['reaction_id'];
    _reactionType = json['reaction_type'];
    _itemId = json['item_id'];
    _clientId = json['client_id'];
    _createdAt = json['created_at'];
  }
  num? _reactionId;
  String? _reactionType;
  num? _itemId;
  num? _clientId;
  String? _createdAt;
Reactions copyWith({  num? reactionId,
  String? reactionType,
  num? itemId,
  num? clientId,
  String? createdAt,
}) => Reactions(  reactionId: reactionId ?? _reactionId,
  reactionType: reactionType ?? _reactionType,
  itemId: itemId ?? _itemId,
  clientId: clientId ?? _clientId,
  createdAt: createdAt ?? _createdAt,
);
  num? get reactionId => _reactionId;
  String? get reactionType => _reactionType;
  num? get itemId => _itemId;
  num? get clientId => _clientId;
  String? get createdAt => _createdAt;

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



Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));
String photosToJson(Photos data) => json.encode(data.toJson());
class Photos {
  Photos({
    num? imageId,
    String? photo,}) {
    _imageId = imageId;
    _photo = photo;
  }

  Photos.fromJson(dynamic json) {
    _imageId = json['image_id'];
    _photo = json['photo'];
  }

  num? _imageId;
  String? _photo;

  Photos copyWith({ num? imageId,
    String? photo,
  }) =>
      Photos(imageId: imageId ?? _imageId,
        photo: photo ?? _photo,
      );

  num? get imageId => _imageId;

  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_id'] = _imageId;
    map['photo'] = _photo;
    return map;
  }
}
