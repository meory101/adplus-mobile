import 'dart:convert';

import '../../../../../core/model/user.dart';

/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"item_id":59,"category_id":4,"city_id":2,"name":"aad","starting_price":1000,"min_increase_price":1000,"type":null,"description":"adsfdfdfdfdfd","keywords":"سيارة,سابا,كيا","slug":null,"status":1,"star":0,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"bidding_start_time":"2024-10-01 12:00:00","photos":[{"image_id":60,"item_id":59,"photo":"1730045154_671e64e281741.webp"},{"image_id":61,"item_id":59,"photo":"1730045154_671e64e2ad1a6.webp"}],"attributes":[{"item_attribute_id":81,"item_id":59,"attribute_id":24,"value":"اتوماتيك","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","ord":1}},{"item_attribute_id":82,"item_id":59,"attribute_id":23,"value":"2000","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","ord":1}},{"item_attribute_id":83,"item_id":59,"attribute_id":19,"value":"مرسيدس","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"نوع المحرك","ord":1}},{"item_attribute_id":84,"item_id":59,"attribute_id":18,"value":"سيارات للبيع","attribute":{"attribute_id":18,"category_id":4,"attribute_name":"النوع","ord":1}},{"item_attribute_id":85,"item_id":59,"attribute_id":14,"value":"بيع","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","ord":1}}],"comments":[],"reaction":[],"author":{"client_id":47,"name":"hla","username":"hla@gmail.com","email":"hla@gmail.com","phone":"+963978567888","whatsapp":"+963978567888","address":null,"photo":"1729458413_671570ed9ea1e.webp","token_expires":0,"is_verified":1,"error_login":0}}
/// errors : []

GetAdvDetailsResponseEntity getAdvDetailsResponseEntityFromJson(String str) =>
    GetAdvDetailsResponseEntity.fromJson(json.decode(str));

String getAdvDetailsResponseEntityToJson(GetAdvDetailsResponseEntity data) =>
    json.encode(data.toJson());

class GetAdvDetailsResponseEntity {
  GetAdvDetailsResponseEntity({
    bool? success,
    String? message,
    AdvDetails? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  GetAdvDetailsResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? AdvDetails.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }

  bool? _success;
  String? _message;
  AdvDetails? _data;
  List<dynamic>? _errors;

  GetAdvDetailsResponseEntity copyWith({
    bool? success,
    String? message,
    AdvDetails? data,
    List<dynamic>? errors,
  }) =>
      GetAdvDetailsResponseEntity(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
        errors: errors ?? _errors,
      );

  bool? get success => _success;

  String? get message => _message;

  AdvDetails? get data => _data;

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

/// item_id : 59
/// category_id : 4
/// city_id : 2
/// name : "aad"
/// starting_price : 1000
/// min_increase_price : 1000
/// type : null
/// description : "adsfdfdfdfdfd"
/// keywords : "سيارة,سابا,كيا"
/// slug : null
/// status : 1
/// star : 0
/// under_review : 1
/// bidding_status : 1
/// homepage_appear : 0
/// ord : 1
/// bidding_start_time : "2024-10-01 12:00:00"
/// photos : [{"image_id":60,"item_id":59,"photo":"1730045154_671e64e281741.webp"},{"image_id":61,"item_id":59,"photo":"1730045154_671e64e2ad1a6.webp"}]
/// attributes : [{"item_attribute_id":81,"item_id":59,"attribute_id":24,"value":"اتوماتيك","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","ord":1}},{"item_attribute_id":82,"item_id":59,"attribute_id":23,"value":"2000","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","ord":1}},{"item_attribute_id":83,"item_id":59,"attribute_id":19,"value":"مرسيدس","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"نوع المحرك","ord":1}},{"item_attribute_id":84,"item_id":59,"attribute_id":18,"value":"سيارات للبيع","attribute":{"attribute_id":18,"category_id":4,"attribute_name":"النوع","ord":1}},{"item_attribute_id":85,"item_id":59,"attribute_id":14,"value":"بيع","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","ord":1}}]
/// comments : []
/// reaction : []
/// author : {"client_id":47,"name":"hla","username":"hla@gmail.com","email":"hla@gmail.com","phone":"+963978567888","whatsapp":"+963978567888","address":null,"photo":"1729458413_671570ed9ea1e.webp","token_expires":0,"is_verified":1,"error_login":0}

AdvDetails dataFromJson(String str) => AdvDetails.fromJson(json.decode(str));

String dataToJson(AdvDetails data) => json.encode(data.toJson());

class AdvDetails {
  AdvDetails({
    num? itemId,
    num? categoryId,
    num? cityId,
    String? name,
    num? startingPrice,
    num? minIncreasePrice,
    dynamic type,
    String? description,
    String? keywords,
    dynamic slug,
    num? status,
    num? star,
    num? underReview,
    num? likeCount,
    num? biddingStatus,
    num? homepageAppear,
    num? ord,
    String? biddingStartTime,
    List<Photos>? photos,
    List<Attributes>? attributes,
    List<dynamic>? comments,
    List<dynamic>? reaction,
    User? author,
  }) {
    _itemId = itemId;
    _likeCount = likeCount;
    _categoryId = categoryId;
    _cityId = cityId;
    _name = name;
    _startingPrice = startingPrice;
    _minIncreasePrice = minIncreasePrice;
    _type = type;
    _description = description;
    _keywords = keywords;
    _slug = slug;
    _status = status;
    _star = star;
    _underReview = underReview;
    _biddingStatus = biddingStatus;
    _homepageAppear = homepageAppear;
    _ord = ord;
    _biddingStartTime = biddingStartTime;
    _photos = photos;
    _attributes = attributes;
    _comments = comments;
    _reaction = reaction;
    _author = author;
  }

  AdvDetails.fromJson(dynamic json) {
    _likeCount = json['like_count'];
    _itemId = json['item_id'];
    _categoryId = json['category_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _startingPrice = json['starting_price'];
    _minIncreasePrice = json['min_increase_price'];
    _type = json['type'];
    _description = json['description'];
    _keywords = json['keywords'];
    _slug = json['slug'];
    _status = json['status'];
    _star = json['star'];
    _underReview = json['under_review'];
    _biddingStatus = json['bidding_status'];
    _homepageAppear = json['homepage_appear'];
    _ord = json['ord'];
    _biddingStartTime = json['bidding_start_time'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    _author = json['author'] != null ? User.fromJson(json['author']) : null;
  }

  num? _itemId;
  num? _categoryId;
  num? _cityId;
  String? _name;
  num? _startingPrice;
  num? _minIncreasePrice;
  dynamic _type;
  String? _description;
  String? _keywords;
  dynamic _slug;
  num? _status;
  num? _star;
  num? _underReview;
  num? _likeCount;
  num? _biddingStatus;
  num? _homepageAppear;
  num? _ord;
  String? _biddingStartTime;
  List<Photos>? _photos;
  List<Attributes>? _attributes;
  List<dynamic>? _comments;
  List<dynamic>? _reaction;
  User? _author;

  AdvDetails copyWith({
    num? itemId,
    num? categoryId,
    num? cityId,
    String? name,
    num? startingPrice,
    num? minIncreasePrice,
    dynamic type,
    String? description,
    String? keywords,
    dynamic slug,
    num? status,
    num? star,
    num? underReview,
    num? biddingStatus,
    num? homepageAppear,
    num? likeCount,
    num? ord,
    String? biddingStartTime,
    List<Photos>? photos,
    List<Attributes>? attributes,
    List<dynamic>? comments,
    List<dynamic>? reaction,
    User? author,
  }) =>
      AdvDetails(
        likeCount:likeCount ?? _likeCount,
        itemId: itemId ?? _itemId,
        categoryId: categoryId ?? _categoryId,
        cityId: cityId ?? _cityId,
        name: name ?? _name,
        startingPrice: startingPrice ?? _startingPrice,
        minIncreasePrice: minIncreasePrice ?? _minIncreasePrice,
        type: type ?? _type,
        description: description ?? _description,
        keywords: keywords ?? _keywords,
        slug: slug ?? _slug,
        status: status ?? _status,
        star: star ?? _star,
        underReview: underReview ?? _underReview,
        biddingStatus: biddingStatus ?? _biddingStatus,
        homepageAppear: homepageAppear ?? _homepageAppear,
        ord: ord ?? _ord,
        biddingStartTime: biddingStartTime ?? _biddingStartTime,
        photos: photos ?? _photos,
        attributes: attributes ?? _attributes,
        comments: comments ?? _comments,
        reaction: reaction ?? _reaction,
        author: author ?? _author,
      );

  num? get itemId => _itemId;

  num? get categoryId => _categoryId;

  num? get cityId => _cityId;

  String? get name => _name;
  num? get likeCount => _likeCount;

  num? get startingPrice => _startingPrice;

  num? get minIncreasePrice => _minIncreasePrice;

  dynamic get type => _type;

  String? get description => _description;

  String? get keywords => _keywords;

  dynamic get slug => _slug;

  num? get status => _status;

  num? get star => _star;

  num? get underReview => _underReview;

  num? get biddingStatus => _biddingStatus;

  num? get homepageAppear => _homepageAppear;

  num? get ord => _ord;

  String? get biddingStartTime => _biddingStartTime;

  List<Photos>? get photos => _photos;

  List<Attributes>? get attributes => _attributes;

  List<dynamic>? get comments => _comments;

  List<dynamic>? get reaction => _reaction;

  User? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['category_id'] = _categoryId;
    map['city_id'] = _cityId;
    map['name'] = _name;
    map['starting_price'] = _startingPrice;
    map['min_increase_price'] = _minIncreasePrice;
    map['type'] = _type;
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['slug'] = _slug;
    map['status'] = _status;
    map['star'] = _star;
    map['under_review'] = _underReview;
    map['bidding_status'] = _biddingStatus;
    map['homepage_appear'] = _homepageAppear;
    map['ord'] = _ord;
    map['bidding_start_time'] = _biddingStartTime;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    if (_reaction != null) {
      map['reaction'] = _reaction?.map((v) => v.toJson()).toList();
    }
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    return map;
  }
}


Attributes attributesFromJson(String str) =>
    Attributes.fromJson(json.decode(str));

String attributesToJson(Attributes data) => json.encode(data.toJson());

class Attributes {
  Attributes({
    num? itemAttributeId,
    num? itemId,
    num? attributeId,
    String? value,
    Attribute? attribute,
  }) {
    _itemAttributeId = itemAttributeId;
    _itemId = itemId;
    _attributeId = attributeId;
    _value = value;
    _attribute = attribute;
  }

  set itemAttributeId(num? value) {
    _itemAttributeId = value;
  }

  Attributes.fromJson(dynamic json) {
    _itemAttributeId = json['item_attribute_id'];
    _itemId = json['item_id'];
    _attributeId = json['attribute_id'];
    _value = json['value'];
    _attribute = json['attribute'] != null
        ? Attribute.fromJson(json['attribute'])
        : null;
  }

  num? _itemAttributeId;
  num? _itemId;
  num? _attributeId;
  String? _value;
  Attribute? _attribute;

  Attributes copyWith({
    num? itemAttributeId,
    num? itemId,
    num? attributeId,
    String? value,
    Attribute? attribute,
  }) =>
      Attributes(
        itemAttributeId: itemAttributeId ?? _itemAttributeId,
        itemId: itemId ?? _itemId,
        attributeId: attributeId ?? _attributeId,
        value: value ?? _value,
        attribute: attribute ?? _attribute,
      );

  num? get itemAttributeId => _itemAttributeId;

  num? get itemId => _itemId;

  num? get attributeId => _attributeId;

  String? get value => _value;

  Attribute? get attribute => _attribute;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_attribute_id'] = _itemAttributeId;
    map['item_id'] = _itemId;
    map['attribute_id'] = _attributeId;
    map['value'] = _value;
    if (_attribute != null) {
      map['attribute'] = _attribute?.toJson();
    }
    return map;
  }

  set itemId(num? value) {
    _itemId = value;
  }

  set attributeId(num? value) {
    _attributeId = value;
  }

  set value(String? value) {
    _value = value;
  }

  set attribute(Attribute? value) {
    _attribute = value;
  }
}

Attribute attributeFromJson(String str) => Attribute.fromJson(json.decode(str));

String attributeToJson(Attribute data) => json.encode(data.toJson());

class Attribute {
  Attribute({
    num? attributeId,
    num? categoryId,
    String? attributeName,
    num? ord,
  }) {
    _attributeId = attributeId;
    _categoryId = categoryId;
    _attributeName = attributeName;
    _ord = ord;
  }

  Attribute.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _categoryId = json['category_id'];
    _attributeName = json['attribute_name'];
    _ord = json['ord'];
  }

  num? _attributeId;
  num? _categoryId;
  String? _attributeName;
  num? _ord;

  Attribute copyWith({
    num? attributeId,
    num? categoryId,
    String? attributeName,
    num? ord,
  }) =>
      Attribute(
        attributeId: attributeId ?? _attributeId,
        categoryId: categoryId ?? _categoryId,
        attributeName: attributeName ?? _attributeName,
        ord: ord ?? _ord,
      );

  num? get attributeId => _attributeId;

  num? get categoryId => _categoryId;

  String? get attributeName => _attributeName;

  num? get ord => _ord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['category_id'] = _categoryId;
    map['attribute_name'] = _attributeName;
    map['ord'] = _ord;
    return map;
  }
}

Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));

String photosToJson(Photos data) => json.encode(data.toJson());

class Photos {
  Photos({
    num? imageId,
    num? itemId,
    String? photo,
  }) {
    _imageId = imageId;
    _itemId = itemId;
    _photo = photo;
  }

  Photos.fromJson(dynamic json) {
    _imageId = json['image_id'];
    _itemId = json['item_id'];
    _photo = json['photo'];
  }

  num? _imageId;
  num? _itemId;
  String? _photo;

  Photos copyWith({
    num? imageId,
    num? itemId,
    String? photo,
  }) =>
      Photos(
        imageId: imageId ?? _imageId,
        itemId: itemId ?? _itemId,
        photo: photo ?? _photo,
      );

  num? get imageId => _imageId;

  num? get itemId => _itemId;

  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_id'] = _imageId;
    map['item_id'] = _itemId;
    map['photo'] = _photo;
    return map;
  }
}
