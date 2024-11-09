import 'dart:convert';

MyFollowingResponseEntity myFollowingResponseEntityFromJson(String str) =>
    MyFollowingResponseEntity.fromJson(json.decode(str));

String myFollowingResponseEntityToJson(MyFollowingResponseEntity data) =>
    json.encode(data.toJson());

class MyFollowingResponseEntity {
  String? message;
  bool? success;
  List<dynamic>? errors;
  Map<String, dynamic>? data;

  MyFollowingResponseEntity({
    this.message,
    this.success,
    this.errors,
    this.data,
  });

  MyFollowingResponseEntity.fromJson(Map<String, dynamic> json) {
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