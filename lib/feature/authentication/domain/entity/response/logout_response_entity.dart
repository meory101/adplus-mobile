import 'dart:convert';

LogoutResponseEntity logoutResponseEntityFromJson(String str) => LogoutResponseEntity.fromJson(json.decode(str));
String logoutResponseEntityToJson(LogoutResponseEntity data) => json.encode(data.toJson());

class LogoutResponseEntity {
  LogoutResponseEntity({
    bool? success,
    String? message,
    List<dynamic>? errors,
    Map<String, dynamic>? data,
  }) {
    _success = success;
    _message = message;
    _errors = errors;
    _data = data;
  }

  LogoutResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : [];
    _data = json['data'] != null ? json['data'] : {};
  }

  bool? _success;
  String? _message;
  List<dynamic>? _errors;
  Map<String, dynamic>? _data;

  LogoutResponseEntity copyWith({
    bool? success,
    String? message,
    List<dynamic>? errors,
    Map<String, dynamic>? data,
  }) => LogoutResponseEntity(
    success: success ?? _success,
    message: message ?? _message,
    errors: errors ?? _errors,
    data: data ?? _data,
  );

  bool? get success => _success;
  String? get message => _message;
  List<dynamic>? get errors => _errors;
  Map<String, dynamic>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_errors != null) {
      map['errors'] = _errors;
    }
    map['data'] = _data;
    return map;
  }
}
