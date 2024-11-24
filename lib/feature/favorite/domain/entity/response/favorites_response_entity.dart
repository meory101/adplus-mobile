import 'dart:convert';

import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

import '../../../../../core/model/pagination.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"item_id":67,"category_id":4,"city_id":9,"name":"The Chance To","starting_price":200,"type":null,"description":"get the changes on the changes","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":0,"bidding_status":1,"homepage_appear":0,"ord":1,"like_count":1,"photos":[{"image_id":71,"item_id":67,"photo":"1730520583_6725a607b5b89.webp"}],"attributes":[{"item_attribute_id":117,"item_id":67,"attribute_id":24,"value":"غير عادي","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","attribute_en_name":"gear","ord":1}},{"item_attribute_id":118,"item_id":67,"attribute_id":23,"value":"200","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","attribute_en_name":null,"ord":1}},{"item_attribute_id":119,"item_id":67,"attribute_id":19,"value":"لكزس","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"نوع المحرك","attribute_en_name":"motor","ord":1}},{"item_attribute_id":120,"item_id":67,"attribute_id":18,"value":"سيارات مطلوبة","attribute":{"attribute_id":18,"category_id":4,"attribute_name":"النوع","attribute_en_name":null,"ord":1}},{"item_attribute_id":121,"item_id":67,"attribute_id":14,"value":"شراء","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","attribute_en_name":null,"ord":1}}],"author":{"client_id":129,"name":"nour","username":"othmannour2001@gmail.com","email":null,"phone":null,"whatsapp":null,"address":null,"description":"The Chance To Publish it is firstyutrt","photo":"1730862790_672adec6246be.webp","token_expires":0,"is_verified":1,"error_login":0}}],"pagination":{"total_items":1,"total_pages":1,"current_page":1,"per_page":10}}
/// errors : []

FavoritesResponseEntity favoritesResponseEntityFromJson(String str) => FavoritesResponseEntity.fromJson(json.decode(str));
String favoritesResponseEntityToJson(FavoritesResponseEntity data) => json.encode(data.toJson());
class FavoritesResponseEntity {
  FavoritesResponseEntity({
      bool? success, 
      String? message, 
      FavoriteData? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  FavoritesResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? FavoriteData.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  FavoriteData? _data;
  List<dynamic>? _errors;
FavoritesResponseEntity copyWith({  bool? success,
  String? message,
  FavoriteData? data,
  List<dynamic>? errors,
}) => FavoritesResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  FavoriteData? get data => _data;
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

/// data : [{"item_id":67,"category_id":4,"city_id":9,"name":"The Chance To","starting_price":200,"type":null,"description":"get the changes on the changes","keywords":"سيارة,سابا,كيا","slug":null,"star":0,"under_review":0,"bidding_status":1,"homepage_appear":0,"ord":1,"like_count":1,"photos":[{"image_id":71,"item_id":67,"photo":"1730520583_6725a607b5b89.webp"}],"attributes":[{"item_attribute_id":117,"item_id":67,"attribute_id":24,"value":"غير عادي","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","attribute_en_name":"gear","ord":1}},{"item_attribute_id":118,"item_id":67,"attribute_id":23,"value":"200","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","attribute_en_name":null,"ord":1}},{"item_attribute_id":119,"item_id":67,"attribute_id":19,"value":"لكزس","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"نوع المحرك","attribute_en_name":"motor","ord":1}},{"item_attribute_id":120,"item_id":67,"attribute_id":18,"value":"سيارات مطلوبة","attribute":{"attribute_id":18,"category_id":4,"attribute_name":"النوع","attribute_en_name":null,"ord":1}},{"item_attribute_id":121,"item_id":67,"attribute_id":14,"value":"شراء","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","attribute_en_name":null,"ord":1}}],"author":{"client_id":129,"name":"nour","username":"othmannour2001@gmail.com","email":null,"phone":null,"whatsapp":null,"address":null,"description":"The Chance To Publish it is firstyutrt","photo":"1730862790_672adec6246be.webp","token_expires":0,"is_verified":1,"error_login":0}}]
/// pagination : {"total_items":1,"total_pages":1,"current_page":1,"per_page":10}

FavoriteData dataFromJson(String str) => FavoriteData.fromJson(json.decode(str));
String dataToJson(FavoriteData data) => json.encode(data.toJson());
class FavoriteData {
  FavoriteData({
      List<AdvDetails>? data,
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  FavoriteData.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AdvDetails.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<AdvDetails>? _data;
  Pagination? _pagination;
FavoriteData copyWith({  List<AdvDetails>? data,
  Pagination? pagination,
}) => FavoriteData(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<AdvDetails>? get data => _data;
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


