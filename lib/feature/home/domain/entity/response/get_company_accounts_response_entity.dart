import 'dart:convert';

import '../../../../../core/model/user.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"client_id":137,"name":"musaab","username":"musaab.obeid@gmail.com","email":"musaab.obeid@gmail.com","phone":null,"whatsapp":"0955884565","address":null,"description":null,"photo":null,"category_id":2,"token_expires":0,"is_verified":1,"error_login":0,"is_company":0}]
/// errors : []

GetCompanyAccountsResponseEntity getCompanyAccountsResponseEntityFromJson(String str) => GetCompanyAccountsResponseEntity.fromJson(json.decode(str));
String getCompanyAccountsResponseEntityToJson(GetCompanyAccountsResponseEntity data) => json.encode(data.toJson());
class GetCompanyAccountsResponseEntity {
  GetCompanyAccountsResponseEntity({
      bool? success, 
      String? message, 
      List<User>? data,
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  GetCompanyAccountsResponseEntity.fromJson(dynamic json) {
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
GetCompanyAccountsResponseEntity copyWith({  bool? success,
  String? message,
  List<User>? data,
  List<dynamic>? errors,
}) => GetCompanyAccountsResponseEntity(  success: success ?? _success,
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
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

