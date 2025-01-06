import 'dart:convert';

UpdateUsernameResponseEntity updateUsernameResponseEntityFromJson(String str) =>
    UpdateUsernameResponseEntity.fromJson(json.decode(str));

String updateUsernameResponseEntityToJson(UpdateUsernameResponseEntity data) =>
    json.encode(data.toJson());

class UpdateUsernameResponseEntity {
  String? _message;
  bool? _success;
  List<dynamic>? _errors;
  Map<String, dynamic>? _data;

  UpdateUsernameResponseEntity({
    String? message,
    bool? success,
    List<dynamic>? errors,
    Map<String, dynamic>? data,
  }) {
    _message = message;
    _success = success;
    _errors = errors ?? [];
    _data = data ?? {};
  }

  UpdateUsernameResponseEntity.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _success = json['success'];
    _errors = json['errors'] ?? [];
    // _data = json['data'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['success'] = _success;
    map['errors'] = _errors;
    map['data'] = _data;
    return map;
  }

  // Getters and Setters
  String? get message => _message;
  set message(String? value) => _message = value;

  bool? get success => _success;
  set success(bool? value) => _success = value;

  List<dynamic>? get errors => _errors;
  set errors(List<dynamic>? value) => _errors = value;

  Map<String, dynamic>? get data => _data;
  set data(Map<String, dynamic>? value) => _data = value;
}
