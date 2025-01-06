import 'dart:convert';

import 'package:mzad_damascus/core/model/comment.dart';

import '../../../../../core/model/pagination.dart';


GetCommentsResponseEntity getCommentsResponseEntityFromJson(String str) => GetCommentsResponseEntity.fromJson(json.decode(str));
String getCommentsResponseEntityToJson(GetCommentsResponseEntity data) => json.encode(data.toJson());
class GetCommentsResponseEntity {
  GetCommentsResponseEntity({
      bool? success, 
      String? message, 
      CommentsResult? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCommentsResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? CommentsResult.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  CommentsResult? _data;
  List<dynamic>? _errors;
GetCommentsResponseEntity copyWith({  bool? success,
  String? message,
  CommentsResult? data,
  List<dynamic>? errors,
}) => GetCommentsResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  CommentsResult? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


CommentsResult dataFromJson(String str) => CommentsResult.fromJson(json.decode(str));
String dataToJson(CommentsResult data) => json.encode(data.toJson());
class CommentsResult {
  CommentsResult({
      List<Comment>? data, 
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  CommentsResult.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Comment.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Comment>? _data;
  Pagination? _pagination;
CommentsResult copyWith({  List<Comment>? data,
  Pagination? pagination,
}) => CommentsResult(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<Comment>? get data => _data;
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

