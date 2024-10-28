import 'dart:convert';

RegisterResponseEntity registerResponseEntityFromJson(String str) => RegisterResponseEntity.fromJson(json.decode(str));

String registerResponseEntityToJson(RegisterResponseEntity data) => json.encode(data.toJson());

class RegisterResponseEntity {
  RegisterResponseEntity({
    String? message,
    bool? success,
    dynamic data,
    List<dynamic>? errors,
  }) {
    _message = message;
    _success = success;
    _data = data;
    _errors = errors;
  }

  RegisterResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _success = json['success'];
    _data = json['data'];
    _errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : [];
  }

  String? _message;
  bool? _success;
  dynamic _data;
  List<dynamic>? _errors;

  RegisterResponseEntity copyWith({
    String? message,
    bool? success,
    dynamic data,
    List<dynamic>? errors,
  }) =>
      RegisterResponseEntity(
        message: message ?? _message,
        success: success ?? _success,
        data: data ?? _data,
        errors: errors ?? _errors,
      );

  String? get message => _message;
  bool? get success => _success;
  dynamic get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['success'] = _success;
    map['data'] = _data;
    map['errors'] = _errors;
    return map;
  }
}
