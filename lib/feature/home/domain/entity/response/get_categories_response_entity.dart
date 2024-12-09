import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"category_id":2,"parent_id":1,"name":"ساعات","en_name":null,"photo":null,"photo_1":null,"photo_2":null,"photo_3":null,"description":"وصف التصنيف من اجل تهيئة الموقع للتوافق مع  SEO","keywords":"ساعات,ماركات","slug":"ساعات","status":1,"homepage_appear":0,"ord":1,"items_count":0,"children":[{"category_id":36,"parent_id":3,"name":"سامسونغ","en_name":null,"photo":"0","photo_1":null,"photo_2":null,"photo_3":null,"description":"هواتف","keywords":"سامسونغ,هاتف,المترونيات","slug":"سامسونغ","status":1,"homepage_appear":0,"ord":1}]}]
/// errors : []

GetCategoriesResponseEntity getCategoriesResponseEntityFromJson(String str) => GetCategoriesResponseEntity.fromJson(json.decode(str));
String getCategoriesResponseEntityToJson(GetCategoriesResponseEntity data) => json.encode(data.toJson());
class GetCategoriesResponseEntity {
  GetCategoriesResponseEntity({
      bool? success, 
      String? message, 
      List<MainCategory>? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCategoriesResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MainCategory.fromJson(v));
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
  List<MainCategory>? _data;
  List<dynamic>? _errors;
GetCategoriesResponseEntity copyWith({  bool? success,
  String? message,
  List<MainCategory>? data,
  List<dynamic>? errors,
}) => GetCategoriesResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<MainCategory>? get data => _data;
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

/// category_id : 2
/// parent_id : 1
/// name : "ساعات"
/// en_name : null
/// photo : null
/// photo_1 : null
/// photo_2 : null
/// photo_3 : null
/// description : "وصف التصنيف من اجل تهيئة الموقع للتوافق مع  SEO"
/// keywords : "ساعات,ماركات"
/// slug : "ساعات"
/// status : 1
/// homepage_appear : 0
/// ord : 1
/// items_count : 0
/// children : [{"category_id":36,"parent_id":3,"name":"سامسونغ","en_name":null,"photo":"0","photo_1":null,"photo_2":null,"photo_3":null,"description":"هواتف","keywords":"سامسونغ,هاتف,المترونيات","slug":"سامسونغ","status":1,"homepage_appear":0,"ord":1}]

MainCategory dataFromJson(String str) => MainCategory.fromJson(json.decode(str));
String dataToJson(MainCategory data) => json.encode(data.toJson());
class MainCategory {
  MainCategory({
      num? categoryId, 
      num? parentId, 
      String? name,
    String? enName,
    String? photo,
    String? photo1,
    String? photo2,
    String? photo3,
      String? description, 
      String? keywords, 
      String? slug, 
      num? status, 
      num? homepageAppear, 
      num? ord, 
      num? itemsCount,
      List<SubCategory>? children,}){
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
    _children = children;
}

  MainCategory.fromJson(dynamic json) {
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
    _itemsCount = json['item_count'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(SubCategory.fromJson(v));
      });
    }
  }
  num? _categoryId;
  num? _parentId;
  String? _name;
  String? _enName;
  String? _photo;
  String? _photo1;
  String? _photo2;
  String? _photo3;
  String? _description;
  String? _keywords;
  String? _slug;
  num? _status;
  num? _homepageAppear;
  num? _ord;
  num? _itemsCount;
  List<SubCategory>? _children;
MainCategory copyWith({  num? categoryId,
  num? parentId,
  String? name,
  String? enName,
  String? photo,
  String? photo1,
  String? photo2,
  String? photo3,
  String? description,
  String? keywords,
  String? slug,
  num? status,
  num? homepageAppear,
  num? ord,
  num? itemsCount,
  List<SubCategory>? children,
}) => MainCategory(  categoryId: categoryId ?? _categoryId,
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
  children: children ?? _children,
);
  num? get categoryId => _categoryId;
  num? get parentId => _parentId;
  String? get name => _name;
  String? get enName => _enName;
  String? get photo => _photo;
  String? get photo1 => _photo1;
  String? get photo2 => _photo2;
  String? get photo3 => _photo3;
  String? get description => _description;
  String? get keywords => _keywords;
  String? get slug => _slug;
  num? get status => _status;
  num? get homepageAppear => _homepageAppear;
  num? get ord => _ord;
  num? get itemsCount => _itemsCount;
  List<SubCategory>? get children => _children;

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
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : 36
/// parent_id : 3
/// name : "سامسونغ"
/// en_name : null
/// photo : "0"
/// photo_1 : null
/// photo_2 : null
/// photo_3 : null
/// description : "هواتف"
/// keywords : "سامسونغ,هاتف,المترونيات"
/// slug : "سامسونغ"
/// status : 1
/// homepage_appear : 0
/// ord : 1

SubCategory childrenFromJson(String str) => SubCategory.fromJson(json.decode(str));
String childrenToJson(SubCategory data) => json.encode(data.toJson());
class SubCategory {
  SubCategory({
      num? categoryId, 
      num? parentId, 
      String? name,
    String? enName,
      String? photo,
    String? photo1,
    String? photo2,
    String? photo3,
      String? description, 
      String? keywords, 
      String? slug, 
      num? status, 
      num? homepageAppear, 
      num? ord,}){
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
}

  SubCategory.fromJson(dynamic json) {
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
  }
  num? _categoryId;
  num? _parentId;
  String? _name;
  String? _enName;
  String? _photo;
  String? _photo1;
  String? _photo2;
  String? _photo3;
  String? _description;
  String? _keywords;
  String? _slug;
  num? _status;
  num? _homepageAppear;
  num? _ord;
SubCategory copyWith({  num? categoryId,
  num? parentId,
  String? name,
  String? enName,
  String? photo,
  String? photo1,
  String? photo2,
  String? photo3,
  String? description,
  String? keywords,
  String? slug,
  num? status,
  num? homepageAppear,
  num? ord,
}) => SubCategory(  categoryId: categoryId ?? _categoryId,
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
);
  num? get categoryId => _categoryId;
  num? get parentId => _parentId;
  String? get name => _name;
  String? get enName => _enName;
  String? get photo => _photo;
  String? get photo1 => _photo1;
  String? get photo2 => _photo2;
  String? get photo3 => _photo3;
  String? get description => _description;
  String? get keywords => _keywords;
  String? get slug => _slug;
  num? get status => _status;
  num? get homepageAppear => _homepageAppear;
  num? get ord => _ord;

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
    return map;
  }

}