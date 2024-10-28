import 'dart:convert';

import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : [{"attribute_id":33,"category_id":3,"attribute_name":"نوع الاعلان","ord":1,"attribute_type_list":[{"type_list_id":101,"option":"خدمات","photo":null},{"type_list_id":102,"option":"تبديل","photo":null},{"type_list_id":103,"option":"أجار","photo":null},{"type_list_id":104,"option":"شراء","photo":null},{"type_list_id":105,"option":"للبيع","photo":null}]},{"attribute_id":34,"category_id":3,"attribute_name":"فئة الهاتف","ord":1,"attribute_type_list":[{"type_list_id":106,"option":"هاتف٢","photo":null},{"type_list_id":107,"option":"آبل حديث","photo":null},{"type_list_id":108,"option":"نوكيا","photo":null},{"type_list_id":109,"option":"شاومي","photo":null},{"type_list_id":110,"option":"آبل","photo":null},{"type_list_id":111,"option":"سامسونغ","photo":null},{"type_list_id":112,"option":"هواوي","photo":null}]}]
/// errors : []

CategoryInsidePageResponseEntity categoryInsidePageResponseEntityFromJson(String str) => CategoryInsidePageResponseEntity.fromJson(json.decode(str));
String categoryInsidePageResponseEntityToJson(CategoryInsidePageResponseEntity data) => json.encode(data.toJson());
class CategoryInsidePageResponseEntity {
  CategoryInsidePageResponseEntity({
      bool? success, 
      String? message, 
      List<CategoryAttributes>? data,
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  CategoryInsidePageResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryAttributes.fromJson(v));
      });
    }
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(CategoryAttributes.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<CategoryAttributes>? _data;
  List<dynamic>? _errors;
CategoryInsidePageResponseEntity copyWith({  bool? success,
  String? message,
  List<CategoryAttributes>? data,
  List<dynamic>? errors,
}) => CategoryInsidePageResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  List<CategoryAttributes>? get data => _data;
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

