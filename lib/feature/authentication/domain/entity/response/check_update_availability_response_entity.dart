import 'dart:convert';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"version_update":"1.1"}
/// errors : []

CheckUpdateAvailabilityResponseEntity checkUpdateAvailabilityResponseEntityFromJson(String str) => CheckUpdateAvailabilityResponseEntity.fromJson(json.decode(str));
String checkUpdateAvailabilityResponseEntityToJson(CheckUpdateAvailabilityResponseEntity data) => json.encode(data.toJson());
class CheckUpdateAvailabilityResponseEntity {
  CheckUpdateAvailabilityResponseEntity({
      bool? success, 
      String? message, 
      Data? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  CheckUpdateAvailabilityResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(Dynamic.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  Data? _data;
  List<dynamic>? _errors;
CheckUpdateAvailabilityResponseEntity copyWith({  bool? success,
  String? message,
  Data? data,
  List<dynamic>? errors,
}) => CheckUpdateAvailabilityResponseEntity(  success: success ?? _success,
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

/// version_update : "1.1"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? versionUpdate,}){
    _versionUpdate = versionUpdate;
}

  Data.fromJson(dynamic json) {
    _versionUpdate = json['version_update'];
  }
  String? _versionUpdate;
Data copyWith({  String? versionUpdate,
}) => Data(  versionUpdate: versionUpdate ?? _versionUpdate,
);
  String? get versionUpdate => _versionUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version_update'] = _versionUpdate;
    return map;
  }

}