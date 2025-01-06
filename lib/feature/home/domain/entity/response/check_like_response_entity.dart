import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"exists":true}
/// errors : []

CheckLikeResponseEntity checkLikeResponseEntityFromJson(String str) => CheckLikeResponseEntity.fromJson(json.decode(str));
String checkLikeResponseEntityToJson(CheckLikeResponseEntity data) => json.encode(data.toJson());
class CheckLikeResponseEntity {
  CheckLikeResponseEntity({
      bool? success, 
      String? message, 
      Data? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  CheckLikeResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  Data? _data;
  List<dynamic>? _errors;
CheckLikeResponseEntity copyWith({  bool? success,
  String? message,
  Data? data,
  List<dynamic>? errors,
}) => CheckLikeResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
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

/// exists : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      bool? exists,}){
    _exists = exists;
}

  Data.fromJson(dynamic json) {
    _exists = json['exists'];
  }
  bool? _exists;
Data copyWith({  bool? exists,
}) => Data(  exists: exists ?? _exists,
);
  bool? get exists => _exists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exists'] = _exists;
    return map;
  }

}