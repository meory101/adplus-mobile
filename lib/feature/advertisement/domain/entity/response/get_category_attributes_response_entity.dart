import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"category_id":3,"parent_id":1,"name":"هواتف","en_name":null,"photo":null,"photo_1":null,"photo_2":null,"photo_3":null,"description":"نقدم لكم مجموعة من الهواتف المنوعة و التي يقدمها المزودون.","keywords":"1,هاتف,الكتلرونيات,هواوي,سامسونغ","slug":"هواتف","status":1,"homepage_appear":0,"ord":1,"items_count":10,"attributes":[{"attribute_id":33,"category_id":3,"attribute_name":"نوع الاعلان","ord":1,"attribute_type":{"attribute_type_id":5,"name":"قائمة","has_list":1},"attribute_type_list":[{"type_list_id":101,"option":"خدمات","photo":null},{"type_list_id":102,"option":"تبديل","photo":null},{"type_list_id":103,"option":"أجار","photo":null},{"type_list_id":104,"option":"شراء","photo":null},{"type_list_id":105,"option":"للبيع","photo":null}]},{"attribute_id":32,"category_id":3,"attribute_name":"الأبعاد","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]},{"attribute_id":31,"category_id":3,"attribute_name":"السعر","ord":1,"attribute_type":{"attribute_type_id":2,"name":"ارقام","has_list":0},"attribute_type_list":[]},{"attribute_id":30,"category_id":3,"attribute_name":"المعالج","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]},{"attribute_id":29,"category_id":3,"attribute_name":"اللون","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]}]}
/// errors : []

GetCategoryAttributesResponseEntity getCategoryAttributesResponseEntityFromJson(String str) => GetCategoryAttributesResponseEntity.fromJson(json.decode(str));
String getCategoryAttributesResponseEntityToJson(GetCategoryAttributesResponseEntity data) => json.encode(data.toJson());
class GetCategoryAttributesResponseEntity {
  GetCategoryAttributesResponseEntity({
      bool? success, 
      String? message, 
      CategoryInfo? data,
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCategoryAttributesResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? CategoryInfo.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  CategoryInfo? _data;
  List<dynamic>? _errors;
GetCategoryAttributesResponseEntity copyWith({  bool? success,
  String? message,
  CategoryInfo? data,
  List<dynamic>? errors,
}) => GetCategoryAttributesResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  CategoryInfo? get data => _data;
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

/// category_id : 3
/// parent_id : 1
/// name : "هواتف"
/// en_name : null
/// photo : null
/// photo_1 : null
/// photo_2 : null
/// photo_3 : null
/// description : "نقدم لكم مجموعة من الهواتف المنوعة و التي يقدمها المزودون."
/// keywords : "1,هاتف,الكتلرونيات,هواوي,سامسونغ"
/// slug : "هواتف"
/// status : 1
/// homepage_appear : 0
/// ord : 1
/// items_count : 10
/// attributes : [{"attribute_id":33,"category_id":3,"attribute_name":"نوع الاعلان","ord":1,"attribute_type":{"attribute_type_id":5,"name":"قائمة","has_list":1},"attribute_type_list":[{"type_list_id":101,"option":"خدمات","photo":null},{"type_list_id":102,"option":"تبديل","photo":null},{"type_list_id":103,"option":"أجار","photo":null},{"type_list_id":104,"option":"شراء","photo":null},{"type_list_id":105,"option":"للبيع","photo":null}]},{"attribute_id":32,"category_id":3,"attribute_name":"الأبعاد","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]},{"attribute_id":31,"category_id":3,"attribute_name":"السعر","ord":1,"attribute_type":{"attribute_type_id":2,"name":"ارقام","has_list":0},"attribute_type_list":[]},{"attribute_id":30,"category_id":3,"attribute_name":"المعالج","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]},{"attribute_id":29,"category_id":3,"attribute_name":"اللون","ord":1,"attribute_type":{"attribute_type_id":1,"name":"text","has_list":0},"attribute_type_list":[]}]

CategoryInfo dataFromJson(String str) => CategoryInfo.fromJson(json.decode(str));
String dataToJson(CategoryInfo data) => json.encode(data.toJson());
class CategoryInfo {
  CategoryInfo({
      num? categoryId,
      num? parentId,
      String? name,
      dynamic enName,
      dynamic photo,
      dynamic photo1,
      dynamic photo2,
      dynamic photo3,
      String? description,
      String? keywords,
      String? slug,
      num? status,
      num? homepageAppear,
      num? ord,
      num? itemsCount,
      List<Attributes>? attributes,}){
    _categoryId = categoryId;
    _parentId = parentId;
    _name = name;
    _enName = enName;
    _photo = photo;
    _photo1 = photo1;
    _photo2 = photo2;
    _photo3 = photo3;
    _description = description;
    _keywords = keywords;
    _slug = slug;
    _status = status;
    _homepageAppear = homepageAppear;
    _ord = ord;
    _itemsCount = itemsCount;
    _attributes = attributes;
}

  CategoryInfo.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _enName = json['en_name'];
    _photo = json['photo'];
    _photo1 = json['photo_1'];
    _photo2 = json['photo_2'];
    _photo3 = json['photo_3'];
    _description = json['description'];
    _keywords = json['keywords'];
    _slug = json['slug'];
    _status = json['status'];
    _homepageAppear = json['homepage_appear'];
    _ord = json['ord'];
    _itemsCount = json['items_count'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
  }
  num? _categoryId;
  num? _parentId;
  String? _name;
  dynamic _enName;
  dynamic _photo;
  dynamic _photo1;
  dynamic _photo2;
  dynamic _photo3;
  String? _description;
  String? _keywords;
  String? _slug;
  num? _status;
  num? _homepageAppear;
  num? _ord;
  num? _itemsCount;
  List<Attributes>? _attributes;
CategoryInfo copyWith({  num? categoryId,
  num? parentId,
  String? name,
  dynamic enName,
  dynamic photo,
  dynamic photo1,
  dynamic photo2,
  dynamic photo3,
  String? description,
  String? keywords,
  String? slug,
  num? status,
  num? homepageAppear,
  num? ord,
  num? itemsCount,
  List<Attributes>? attributes,
}) => CategoryInfo(  categoryId: categoryId ?? _categoryId,
  parentId: parentId ?? _parentId,
  name: name ?? _name,
  enName: enName ?? _enName,
  photo: photo ?? _photo,
  photo1: photo1 ?? _photo1,
  photo2: photo2 ?? _photo2,
  photo3: photo3 ?? _photo3,
  description: description ?? _description,
  keywords: keywords ?? _keywords,
  slug: slug ?? _slug,
  status: status ?? _status,
  homepageAppear: homepageAppear ?? _homepageAppear,
  ord: ord ?? _ord,
  itemsCount: itemsCount ?? _itemsCount,
  attributes: attributes ?? _attributes,
);
  num? get categoryId => _categoryId;
  num? get parentId => _parentId;
  String? get name => _name;
  dynamic get enName => _enName;
  dynamic get photo => _photo;
  dynamic get photo1 => _photo1;
  dynamic get photo2 => _photo2;
  dynamic get photo3 => _photo3;
  String? get description => _description;
  String? get keywords => _keywords;
  String? get slug => _slug;
  num? get status => _status;
  num? get homepageAppear => _homepageAppear;
  num? get ord => _ord;
  num? get itemsCount => _itemsCount;
  List<Attributes>? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['parent_id'] = _parentId;
    map['name'] = _name;
    map['en_name'] = _enName;
    map['photo'] = _photo;
    map['photo_1'] = _photo1;
    map['photo_2'] = _photo2;
    map['photo_3'] = _photo3;
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['slug'] = _slug;
    map['status'] = _status;
    map['homepage_appear'] = _homepageAppear;
    map['ord'] = _ord;
    map['items_count'] = _itemsCount;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// attribute_id : 33
/// category_id : 3
/// attribute_name : "نوع الاعلان"
/// ord : 1
/// attribute_type : {"attribute_type_id":5,"name":"قائمة","has_list":1}
/// attribute_type_list : [{"type_list_id":101,"option":"خدمات","photo":null},{"type_list_id":102,"option":"تبديل","photo":null},{"type_list_id":103,"option":"أجار","photo":null},{"type_list_id":104,"option":"شراء","photo":null},{"type_list_id":105,"option":"للبيع","photo":null}]

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      num? attributeId, 
      num? categoryId, 
      String? attributeName, 
      num? ord, 
      AttributeType? attributeType, 
      List<AttributeTypeList>? attributeTypeList,}){
    _attributeId = attributeId;
    _categoryId = categoryId;
    _attributeName = attributeName;
    _ord = ord;
    _attributeType = attributeType;
    _attributeTypeList = attributeTypeList;
}

  Attributes.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _categoryId = json['category_id'];
    _attributeName = json['attribute_name'];
    _ord = json['ord'];
    _attributeType = json['attribute_type'] != null ? AttributeType.fromJson(json['attribute_type']) : null;
    if (json['attribute_type_list'] != null) {
      _attributeTypeList = [];
      json['attribute_type_list'].forEach((v) {
        _attributeTypeList?.add(AttributeTypeList.fromJson(v));
      });
    }
  }
  num? _attributeId;
  num? _categoryId;
  String? _attributeName;
  num? _ord;
  AttributeType? _attributeType;
  List<AttributeTypeList>? _attributeTypeList;
Attributes copyWith({  num? attributeId,
  num? categoryId,
  String? attributeName,
  num? ord,
  AttributeType? attributeType,
  List<AttributeTypeList>? attributeTypeList,
}) => Attributes(  attributeId: attributeId ?? _attributeId,
  categoryId: categoryId ?? _categoryId,
  attributeName: attributeName ?? _attributeName,
  ord: ord ?? _ord,
  attributeType: attributeType ?? _attributeType,
  attributeTypeList: attributeTypeList ?? _attributeTypeList,
);
  num? get attributeId => _attributeId;
  num? get categoryId => _categoryId;
  String? get attributeName => _attributeName;
  num? get ord => _ord;
  AttributeType? get attributeType => _attributeType;
  List<AttributeTypeList>? get attributeTypeList => _attributeTypeList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['category_id'] = _categoryId;
    map['attribute_name'] = _attributeName;
    map['ord'] = _ord;
    if (_attributeType != null) {
      map['attribute_type'] = _attributeType?.toJson();
    }
    if (_attributeTypeList != null) {
      map['attribute_type_list'] = _attributeTypeList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type_list_id : 101
/// option : "خدمات"
/// photo : null

AttributeTypeList attributeTypeListFromJson(String str) => AttributeTypeList.fromJson(json.decode(str));
String attributeTypeListToJson(AttributeTypeList data) => json.encode(data.toJson());
class AttributeTypeList {
  AttributeTypeList({
      num? typeListId, 
      String? option, 
      dynamic photo,}){
    _typeListId = typeListId;
    _option = option;
    _photo = photo;
}

  AttributeTypeList.fromJson(dynamic json) {
    _typeListId = json['type_list_id'];
    _option = json['option'];
    _photo = json['photo'];
  }
  num? _typeListId;
  String? _option;
  dynamic _photo;
AttributeTypeList copyWith({  num? typeListId,
  String? option,
  dynamic photo,
}) => AttributeTypeList(  typeListId: typeListId ?? _typeListId,
  option: option ?? _option,
  photo: photo ?? _photo,
);
  num? get typeListId => _typeListId;
  String? get option => _option;
  dynamic get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_list_id'] = _typeListId;
    map['option'] = _option;
    map['photo'] = _photo;
    return map;
  }

}

/// attribute_type_id : 5
/// name : "قائمة"
/// has_list : 1

AttributeType attributeTypeFromJson(String str) => AttributeType.fromJson(json.decode(str));
String attributeTypeToJson(AttributeType data) => json.encode(data.toJson());
class AttributeType {
  AttributeType({
      num? attributeTypeId, 
      String? name, 
      num? hasList,}){
    _attributeTypeId = attributeTypeId;
    _name = name;
    _hasList = hasList;
}

  AttributeType.fromJson(dynamic json) {
    _attributeTypeId = json['attribute_type_id'];
    _name = json['name'];
    _hasList = json['has_list'];
  }
  num? _attributeTypeId;
  String? _name;
  num? _hasList;
AttributeType copyWith({  num? attributeTypeId,
  String? name,
  num? hasList,
}) => AttributeType(  attributeTypeId: attributeTypeId ?? _attributeTypeId,
  name: name ?? _name,
  hasList: hasList ?? _hasList,
);
  num? get attributeTypeId => _attributeTypeId;
  String? get name => _name;
  num? get hasList => _hasList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_type_id'] = _attributeTypeId;
    map['name'] = _name;
    map['has_list'] = _hasList;
    return map;
  }

}