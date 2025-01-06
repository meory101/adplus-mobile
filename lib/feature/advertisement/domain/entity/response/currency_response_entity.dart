import 'dart:convert';

import '../../../../../core/model/currency.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"currency_id":1,"ar_name":"ليرة","en_name":"Lira"},{"currency_id":2,"ar_name":"دولار","en_name":"Dollar"}]
/// errors : []

CurrencyResponseEntity currencyResponseEntityFromJson(String str) => CurrencyResponseEntity.fromJson(json.decode(str));
String currencyResponseEntityToJson(CurrencyResponseEntity data) => json.encode(data.toJson());
class CurrencyResponseEntity {
  CurrencyResponseEntity({
      bool? success, 
      String? message, 
      List<Currency>? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  CurrencyResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Currency.fromJson(v));
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
  List<Currency>? _data;
  List<dynamic>? _errors;
CurrencyResponseEntity copyWith({  bool? success,
  String? message,
  List<Currency>? data,
  List<dynamic>? errors,
}) => CurrencyResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<Currency>? get data => _data;
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


