import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"banner_id":1,"photo":"1726336067_66e5cc432dcd2.webp","status":1,"center_appear":0,"side_appear":1,"ord":1,"created_at":"2024-09-14T15:47:48.000000Z","updated_at":"2024-09-14T16:12:45.000000Z","created_by":1,"updated_by":null}],"pagination":{"total_items":1,"total_pages":1,"current_page":1,"per_page":10}}
/// errors : []

BannersResponseEntity bannersResponseEntityFromJson(String str) => BannersResponseEntity.fromJson(json.decode(str));
String bannersResponseEntityToJson(BannersResponseEntity data) => json.encode(data.toJson());
class BannersResponseEntity {
  BannersResponseEntity({
      bool? success, 
      String? message, 
      BannersResult? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  BannersResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? BannersResult.fromJson(json['data']) : null;
   
  }
  bool? _success;
  String? _message;
  BannersResult? _data;
  List<dynamic>? _errors;
BannersResponseEntity copyWith({  bool? success,
  String? message,
  BannersResult? data,
  List<dynamic>? errors,
}) => BannersResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  BannersResult? get data => _data;
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

/// data : [{"banner_id":1,"photo":"1726336067_66e5cc432dcd2.webp","status":1,"center_appear":0,"side_appear":1,"ord":1,"created_at":"2024-09-14T15:47:48.000000Z","updated_at":"2024-09-14T16:12:45.000000Z","created_by":1,"updated_by":null}]
/// pagination : {"total_items":1,"total_pages":1,"current_page":1,"per_page":10}

BannersResult dataFromJson(String str) => BannersResult.fromJson(json.decode(str));
String dataToJson(BannersResult data) => json.encode(data.toJson());
class BannersResult {
  BannersResult({
      List<Banners>? data, 
     }){
    _data = data;
}

  BannersResult.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Banners.fromJson(v));
      });
    }
  }
  List<Banners>? _data;
BannersResult copyWith({  List<Banners>? data,
}) => BannersResult(  data: data ?? _data,
);
  List<Banners>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
   
    return map;
  }

}

Banners bannerFromJson(String str) => Banners.fromJson(json.decode(str));
String bannerToJson(Banners data) => json.encode(data.toJson());
class Banners {
  Banners({
    num? bannerId,
    String? photo,
    num? status,
    num? centerAppear,
    num? sideAppear,
    num? ord,
    String? createdAt,
    String? updatedAt,
    num? createdBy,
    dynamic updatedBy,}){
    _bannerId = bannerId;
    _photo = photo;
    _status = status;
    _centerAppear = centerAppear;
    _sideAppear = sideAppear;
    _ord = ord;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
  }

  Banners.fromJson(dynamic json) {
    _bannerId = json['banner_id'];
    _photo = json['photo'];
    _status = json['status'];
    _centerAppear = json['center_appear'];
    _sideAppear = json['side_appear'];
    _ord = json['ord'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
  }
  num? _bannerId;
  String? _photo;
  num? _status;
  num? _centerAppear;
  num? _sideAppear;
  num? _ord;
  String? _createdAt;
  String? _updatedAt;
  num? _createdBy;
  dynamic _updatedBy;
  Banners copyWith({  num? bannerId,
    String? photo,
    num? status,
    num? centerAppear,
    num? sideAppear,
    num? ord,
    String? createdAt,
    String? updatedAt,
    num? createdBy,
    dynamic updatedBy,
  }) => Banners(  bannerId: bannerId ?? _bannerId,
    photo: photo ?? _photo,
    status: status ?? _status,
    centerAppear: centerAppear ?? _centerAppear,
    sideAppear: sideAppear ?? _sideAppear,
    ord: ord ?? _ord,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    createdBy: createdBy ?? _createdBy,
    updatedBy: updatedBy ?? _updatedBy,
  );
  num? get bannerId => _bannerId;
  String? get photo => _photo;
  num? get status => _status;
  num? get centerAppear => _centerAppear;
  num? get sideAppear => _sideAppear;
  num? get ord => _ord;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banner_id'] = _bannerId;
    map['photo'] = _photo;
    map['status'] = _status;
    map['center_appear'] = _centerAppear;
    map['side_appear'] = _sideAppear;
    map['ord'] = _ord;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['created_by'] = _createdBy;
    map['updated_by'] = _updatedBy;
    return map;
  }

}


