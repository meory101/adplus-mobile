import 'dart:convert';

VerifyUsernameResponseEntity verifyUsernameResponseEntityFromJson(String str) =>
    VerifyUsernameResponseEntity.fromJson(json.decode(str));

String verifyUsernameResponseEntityToJson(VerifyUsernameResponseEntity data) =>
    json.encode(data.toJson());

class VerifyUsernameResponseEntity {
  String? message;
  bool? success;
  List<dynamic>? errors;
  Map<String, dynamic>? data;

  VerifyUsernameResponseEntity({
    this.message,
    this.success,
    this.errors,
    this.data,
  });

  VerifyUsernameResponseEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    errors = json['errors'] ?? [];
    data = json['data'] ?? {};
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'errors': errors,
      'data': data,
    };
  }
}
