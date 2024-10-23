import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"attribute_id":25,"category_id":11,"attribute_name":"نوع الإعلان","ord":1,"attribute_type_list":[{"type_list_id":85,"option":"خدمات صيانة","photo":null},{"type_list_id":86,"option":"تبديل","photo":null},{"type_list_id":87,"option":"شراء","photo":null},{"type_list_id":88,"option":"بيع","photo":null}]},null]
/// errors : []

GetCategoryAttributesResponseEntity getCategoryAttributesResponseEntityFromJson(String str) => GetCategoryAttributesResponseEntity.fromJson(json.decode(str));
String getCategoryAttributesResponseEntityToJson(GetCategoryAttributesResponseEntity data) => json.encode(data.toJson());
class GetCategoryAttributesResponseEntity {
  GetCategoryAttributesResponseEntity({
      bool? success, 
      String? message, 
      List<Attribute>? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCategoryAttributesResponseEntity.fromJson(dynamic json) {
    print(json['message']);
    print('enttttttttt');
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Attribute.fromJson(v));
      });
    }
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  List<Attribute>? _data;
  List<dynamic>? _errors;
GetCategoryAttributesResponseEntity copyWith({  bool? success,
  String? message,
  List<Attribute>? data,
  List<dynamic>? errors,
}) => GetCategoryAttributesResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<Attribute>? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// attribute_id : 25
/// category_id : 11
/// attribute_name : "نوع الإعلان"
/// ord : 1
/// attribute_type_list : [{"type_list_id":85,"option":"خدمات صيانة","photo":null},{"type_list_id":86,"option":"تبديل","photo":null},{"type_list_id":87,"option":"شراء","photo":null},{"type_list_id":88,"option":"بيع","photo":null}]

Attribute dataFromJson(String str) => Attribute.fromJson(json.decode(str));
String dataToJson(Attribute data) => json.encode(data.toJson());
class Attribute {
  Attribute({
      num? attributeId, 
      num? categoryId, 
      String? attributeName, 
      num? ord, 
      List<AttributeTypeList>? attributeTypeList,}){
    _attributeId = attributeId;
    _categoryId = categoryId;
    _attributeName = attributeName;
    _ord = ord;
    _attributeTypeList = attributeTypeList;
}

  Attribute.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _categoryId = json['category_id'];
    _attributeName = json['attribute_name'];
    _ord = json['ord'];
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
  List<AttributeTypeList>? _attributeTypeList;
Attribute copyWith({  num? attributeId,
  num? categoryId,
  String? attributeName,
  num? ord,
  List<AttributeTypeList>? attributeTypeList,
}) => Attribute(  attributeId: attributeId ?? _attributeId,
  categoryId: categoryId ?? _categoryId,
  attributeName: attributeName ?? _attributeName,
  ord: ord ?? _ord,
  attributeTypeList: attributeTypeList ?? _attributeTypeList,
);
  num? get attributeId => _attributeId;
  num? get categoryId => _categoryId;
  String? get attributeName => _attributeName;
  num? get ord => _ord;
  List<AttributeTypeList>? get attributeTypeList => _attributeTypeList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['category_id'] = _categoryId;
    map['attribute_name'] = _attributeName;
    map['ord'] = _ord;
    if (_attributeTypeList != null) {
      map['attribute_type_list'] = _attributeTypeList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type_list_id : 85
/// option : "خدمات صيانة"
/// photo : null

AttributeTypeList attributeTypeListFromJson(String str) => AttributeTypeList.fromJson(json.decode(str));
String attributeTypeListToJson(AttributeTypeList data) => json.encode(data.toJson());
class AttributeTypeList {
  AttributeTypeList({
      num? typeListId, 
      String? option, 
      String? photo,}){
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
  String? _photo;
AttributeTypeList copyWith({  num? typeListId,
  String? option,
  String? photo,
}) => AttributeTypeList(  typeListId: typeListId ?? _typeListId,
  option: option ?? _option,
  photo: photo ?? _photo,
);
  num? get typeListId => _typeListId;
  String? get option => _option;
  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_list_id'] = _typeListId;
    map['option'] = _option;
    map['photo'] = _photo;
    return map;
  }

}