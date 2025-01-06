import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"city_id":2,"ar_name":"دمشق","en_name":"Damascus","code":"DAM","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":3,"ar_name":"حلب","en_name":"Aleppo","code":"ALE","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":4,"ar_name":"حمص","en_name":"Homs","code":"HOM","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":5,"ar_name":"حماة","en_name":"Hama","code":"HAM","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":6,"ar_name":"اللاذقية","en_name":"Latakia","code":"LAT","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":7,"ar_name":"طرطوس","en_name":"Tartus","code":"TAR","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":8,"ar_name":"دير الزور","en_name":"Deir ez-Zor","code":"DEZ","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":9,"ar_name":"الرقة","en_name":"Raqqa","code":"RAQ","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":10,"ar_name":"إدلب","en_name":"Idlib","code":"IDL","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":11,"ar_name":"درعا","en_name":"Daraa","code":"DAR","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":12,"ar_name":"الحسكة","en_name":"Al-Hasakah","code":"HAS","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":13,"ar_name":"القنيطرة","en_name":"Quneitra","code":"QUN","created_at":"2024-10-23T13:39:42.000000Z"},{"city_id":14,"ar_name":"السويداء","en_name":"As-Suwayda","code":"SWA","created_at":"2024-10-23T13:39:42.000000Z"}]
/// errors : []

GetCitiesResponseEntity getCitiesResponseEntityFromJson(String str) => GetCitiesResponseEntity.fromJson(json.decode(str));
String getCitiesResponseEntityToJson(GetCitiesResponseEntity data) => json.encode(data.toJson());
class GetCitiesResponseEntity {
  GetCitiesResponseEntity({
      bool? success, 
      String? message, 
      List<City>? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCitiesResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(City.fromJson(v));
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
  List<City>? _data;
  List<dynamic>? _errors;
GetCitiesResponseEntity copyWith({  bool? success,
  String? message,
  List<City>? data,
  List<dynamic>? errors,
}) => GetCitiesResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<City>? get data => _data;
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

/// city_id : 2
/// ar_name : "دمشق"
/// en_name : "Damascus"
/// code : "DAM"
/// created_at : "2024-10-23T13:39:42.000000Z"

City dataFromJson(String str) => City.fromJson(json.decode(str));
String dataToJson(City data) => json.encode(data.toJson());
class City {
  City({
      num? cityId, 
      String? arName, 
      String? enName, 
      String? code, 
      String? createdAt,}){
    _cityId = cityId;
    _arName = arName;
    _enName = enName;
    _code = code;
    _createdAt = createdAt;
}

  City.fromJson(dynamic json) {
    _cityId = json['city_id'];
    _arName = json['ar_name'];
    _enName = json['en_name'];
    _code = json['code'];
    _createdAt = json['created_at'];
  }
  num? _cityId;
  String? _arName;
  String? _enName;
  String? _code;
  String? _createdAt;
City copyWith({  num? cityId,
  String? arName,
  String? enName,
  String? code,
  String? createdAt,
}) => City(  cityId: cityId ?? _cityId,
  arName: arName ?? _arName,
  enName: enName ?? _enName,
  code: code ?? _code,
  createdAt: createdAt ?? _createdAt,
);
  num? get cityId => _cityId;
  String? get arName => _arName;
  String? get enName => _enName;
  String? get code => _code;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_id'] = _cityId;
    map['ar_name'] = _arName;
    map['en_name'] = _enName;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    return map;
  }

}