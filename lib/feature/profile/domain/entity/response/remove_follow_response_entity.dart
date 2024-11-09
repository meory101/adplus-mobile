import 'dart:convert';

RemoveFollowResponseEntity removeFollowResponseEntityFromJson(String str) =>
    RemoveFollowResponseEntity.fromJson(json.decode(str));

String removeFollowResponseEntityToJson(RemoveFollowResponseEntity data) =>
    json.encode(data.toJson());

class RemoveFollowResponseEntity {
  RemoveFollowResponseEntity({
    bool? success,
    String? message,
    RemoveFollowData? data,
    dynamic errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  RemoveFollowResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? RemoveFollowData.fromJson(json['data']) : null;
    _errors = json['errors'];
  }

  bool? _success;
  String? _message;
  RemoveFollowData? _data;
  dynamic _errors;

  bool? get success => _success;
  String? get message => _message;
  RemoveFollowData? get data => _data;
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

class RemoveFollowData {
  RemoveFollowData({
    String? followingId,
  }) {
    _followingId = followingId;
  }

  RemoveFollowData.fromJson(dynamic json) {
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