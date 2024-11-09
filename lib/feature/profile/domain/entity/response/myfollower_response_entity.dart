import 'dart:convert';

MyFollowersResponseEntity myFollowersResponseEntityFromJson(String str) =>
    MyFollowersResponseEntity.fromJson(json.decode(str));

String myFollowersResponseEntityToJson(MyFollowersResponseEntity data) =>
    json.encode(data.toJson());

class MyFollowersResponseEntity {
  String? message;
  bool? success;
  List<dynamic>? errors;
  Map<String, dynamic>? data;

  MyFollowersResponseEntity({
    this.message,
    this.success,
    this.errors,
    this.data,
  });

  MyFollowersResponseEntity.fromJson(Map<String, dynamic> json) {
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
