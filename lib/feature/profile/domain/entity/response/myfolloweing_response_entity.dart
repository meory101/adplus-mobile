import 'dart:convert';

import '../../../../../core/model/pagination.dart';
import '../../../../home/domain/entity/response/user.dart';

MyFollowingResponseEntity myFollowingResponseEntityFromJson(String str) =>
    MyFollowingResponseEntity.fromJson(json.decode(str));

String myFollowingResponseEntityToJson(MyFollowingResponseEntity data) =>
    json.encode(data.toJson());

class MyFollowingResponseEntity {
  MyFollowingResponseEntity({
    bool? success,
    String? message,
    MyFollowingData? data,
    List<dynamic>? errors,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
  }

  MyFollowingResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? MyFollowingData.fromJson(json['data']) : null;
    _errors = json['errors'] != null ? List<dynamic>.from(json['errors']) : [];
  }

  bool? _success;
  String? _message;
  MyFollowingData? _data;
  List<dynamic>? _errors;

  bool? get success => _success;
  String? get message => _message;
  MyFollowingData? get data => _data;
  List<dynamic>? get errors => _errors;

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

class MyFollowingData {
  MyFollowingData({
    List<User>? data,
    Pagination? pagination,
  }) {
    _data = data;
    _pagination = pagination;
  }

  MyFollowingData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(User.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  List<User>? _data;
  Pagination? _pagination;

  List<User>? get data => _data;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}


