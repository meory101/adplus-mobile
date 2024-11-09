import 'dart:convert';

AddFollowResponseEntity addFollowResponseEntityFromJson(String str) =>
    AddFollowResponseEntity.fromJson(json.decode(str));

String addFollowResponseEntityToJson(AddFollowResponseEntity data) =>
    json.encode(data.toJson());

class AddFollowResponseEntity {
  AddFollowResponseEntity({
    bool? success,
    String? message,
    AddFollowData? data,
    dynamic errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  AddFollowResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? AddFollowData.fromJson(json['data']) : null;
    _errors = json['errors'];
  }

  bool? _success;
  String? _message;
  AddFollowData? _data;
  dynamic _errors;

  bool? get success => _success;
  String? get message => _message;
  AddFollowData? get data => _data;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }
}

class AddFollowData {
  AddFollowData({
    String? followingId,
  }) {
    _followingId = followingId;
  }

  AddFollowData.fromJson(dynamic json) {
    _followingId = json['following_id']?.toString();
  }

  String? _followingId;

  String? get followingId => _followingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['following_id'] = _followingId;
    return map;
  }
}