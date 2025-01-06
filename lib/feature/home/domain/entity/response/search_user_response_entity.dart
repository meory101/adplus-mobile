import 'dart:convert';

import 'package:mzad_damascus/core/model/user.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"client_id":37,"name":"Noura","username":"noura@client.com","email":"noura@client.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},{"client_id":38,"name":"noura","username":"noura@gmail.com","email":"noura@gmail.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},{"client_id":99,"name":"noura","username":"nouraterkawi@gmail.com","email":"nouraterkawi@gmail.com","phone":null,"whatsapp":"+963999050162","address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},{"client_id":105,"name":"Murad12","username":"nour.90.othman@gmail.com","email":"nour.90.othman@gmail.com","phone":null,"whatsapp":"963999999999","address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},{"client_id":106,"name":"Murafggfgfgd","username":"othmannour@g.com","email":"othmannour@g.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":1},{"client_id":107,"name":"nour","username":"othmannour2004@gmail.com","email":"othmannour2004@gmail.com","phone":"+963999999999","whatsapp":"0991338394","address":null,"description":null,"photo":"1730086284_671f058cbfbaf.webp","token_expires":0,"is_verified":0,"error_login":0},{"client_id":108,"name":"nour","username":"n@g.com","email":"n@g.com","phone":null,"whatsapp":null,"address":null,"description":null,"photo":null,"token_expires":0,"is_verified":1,"error_login":0},{"client_id":109,"name":"Murad","username":"othmannour200@gmail.com","email":"othmannour200@gmail.com","phone":null,"whatsapp":"963999999999","address":null,"description":null,"photo":null,"token_expires":0,"is_verified":0,"error_login":0},{"client_id":115,"name":"Nour othman","username":"othmannour@gmail.com","email":"othmannour@gmail.com","phone":null,"whatsapp":"963983708697","address":null,"description":null,"photo":null,"token_expires":0,"is_verified":0,"error_login":0},{"client_id":129,"name":"nour","username":"othmannour2001@gmail.com","email":null,"phone":null,"whatsapp":null,"address":null,"description":"The Chance To Publish it is firstyutrt","photo":"1730862790_672adec6246be.webp","token_expires":0,"is_verified":1,"error_login":0},{"client_id":132,"name":"noura","username":"noura23888@yahoo.com","email":"noura.terkawi@gmail.com","phone":"+963999050162","whatsapp":"+963999050162","address":null,"description":"test profile","photo":null,"token_expires":0,"is_verified":1,"error_login":0}]
/// errors : []

SearchUserResponseEntity searchUserResponseEntityFromJson(String str) => SearchUserResponseEntity.fromJson(json.decode(str));
String searchUserResponseEntityToJson(SearchUserResponseEntity data) => json.encode(data.toJson());
class SearchUserResponseEntity {
  SearchUserResponseEntity({
      bool? success, 
      String? message, 
      List<User>? data,
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  SearchUserResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(User.fromJson(v));
      });
    }
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  List<User>? _data;
  List<dynamic>? _errors;
SearchUserResponseEntity copyWith({  bool? success,
  String? message,
  List<User>? data,
  List<dynamic>? errors,
}) => SearchUserResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<User>? get data => _data;
  List<dynamic>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    // if (_data != null) {
    //   map['data'] = _data?.map((v) => v?.toJson()).toList();
    // }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

