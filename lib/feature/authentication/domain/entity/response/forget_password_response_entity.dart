import 'dart:convert';

/// success : true
/// message : "تمت العملية بنجاح"
/// errors : []

ForgetPasswordResponseEntity forgetPasswordResponseEntityFromJson(String str) =>
    ForgetPasswordResponseEntity.fromJson(json.decode(str));
String forgetPasswordResponseEntityToJson(ForgetPasswordResponseEntity data) =>
    json.encode(data.toJson());

class ForgetPasswordResponseEntity {
  ForgetPasswordResponseEntity({
    bool? success,
    String? message,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _errors = errors ?? [];
  }

  ForgetPasswordResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _errors = json['errors'] ?? [];
  }

  bool? _success;
  String? _message;
  List<dynamic>? _errors;

  ForgetPasswordResponseEntity copyWith({
    bool? success,
    String? message,
    List<dynamic>? errors,
  }) =>
      ForgetPasswordResponseEntity(
        success: success ?? _success,
        message: message ?? _message,
        errors: errors ?? _errors,
      );

  bool? get success => _success;
  String? get message => _message;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_errors != null) {
      map['errors'] = _errors;
    }
    return map;
  }
}
