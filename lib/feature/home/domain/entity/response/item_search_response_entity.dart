import 'dart:convert';

import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';

import '../../../../../core/model/pagination.dart';
/// success : true
/// message : "تمت العملية بنجاح"
/// data : {"data":[{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"like_count":0,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}],"attributes":[{"item_attribute_id":489,"item_id":144,"attribute_id":24,"value":"Automatic","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","attribute_en_name":"gear","star":0,"ord":1}},{"item_attribute_id":490,"item_id":144,"attribute_id":19,"value":"BMW","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"الموتور","attribute_en_name":"motor","star":0,"ord":1}},{"item_attribute_id":491,"item_id":144,"attribute_id":23,"value":"454ggv","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","attribute_en_name":null,"star":0,"ord":1}},{"item_attribute_id":492,"item_id":144,"attribute_id":14,"value":"Buty","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","attribute_en_name":"Ads Type","star":1,"ord":1}}],"author":{"client_id":80,"name":"hla","username":"hla.zarqa@gmail.com","email":null,"phone":"+963931226394","whatsapp":"+963931226394","address":null,"description":"مهندس","photo":"1731522366_6734ef3eb338f.webp","category_id":null,"token_expires":0,"is_verified":1,"error_login":0,"is_company":0}}],"pagination":{"total_items":11,"total_pages":2,"current_page":1,"per_page":10}}
/// errors : []

ItemSearchResponseEntity itemSearchResponseEntityFromJson(String str) => ItemSearchResponseEntity.fromJson(json.decode(str));
String itemSearchResponseEntityToJson(ItemSearchResponseEntity data) => json.encode(data.toJson());
class ItemSearchResponseEntity {
  ItemSearchResponseEntity({
      bool? success, 
      String? message, 
      ItemSearchResult? data, 
      List<dynamic>? errors,}){
    _success = success;
    _message = message;
    _data = data;
    _errors = errors;
}

  ItemSearchResponseEntity.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? ItemSearchResult.fromJson(json['data']) : null;
    // if (json['errors'] != null) {
    //   _errors = [];
    //   json['errors'].forEach((v) {
    //     _errors?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  bool? _success;
  String? _message;
  ItemSearchResult? _data;
  List<dynamic>? _errors;
ItemSearchResponseEntity copyWith({  bool? success,
  String? message,
  ItemSearchResult? data,
  List<dynamic>? errors,
}) => ItemSearchResponseEntity(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  String? get message => _message;
  ItemSearchResult? get data => _data;
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

/// data : [{"item_id":144,"category_id":4,"city_id":2,"name":"Etc gggg","starting_price":100,"type":null,"description":"Rtt is. 5ddd rrtf","keywords":"سيارة,سابا,كيا","slug":null,"star":1,"under_review":1,"bidding_status":1,"homepage_appear":0,"ord":1,"like_count":0,"photos":[{"image_id":177,"item_id":144,"photo":"1732565608_6744da6891882.webp"}],"attributes":[{"item_attribute_id":489,"item_id":144,"attribute_id":24,"value":"Automatic","attribute":{"attribute_id":24,"category_id":4,"attribute_name":"نوع الغيار","attribute_en_name":"gear","star":0,"ord":1}},{"item_attribute_id":490,"item_id":144,"attribute_id":19,"value":"BMW","attribute":{"attribute_id":19,"category_id":4,"attribute_name":"الموتور","attribute_en_name":"motor","star":0,"ord":1}},{"item_attribute_id":491,"item_id":144,"attribute_id":23,"value":"454ggv","attribute":{"attribute_id":23,"category_id":4,"attribute_name":"سنة الصنع","attribute_en_name":null,"star":0,"ord":1}},{"item_attribute_id":492,"item_id":144,"attribute_id":14,"value":"Buty","attribute":{"attribute_id":14,"category_id":4,"attribute_name":"نوع الإعلان","attribute_en_name":"Ads Type","star":1,"ord":1}}],"author":{"client_id":80,"name":"hla","username":"hla.zarqa@gmail.com","email":null,"phone":"+963931226394","whatsapp":"+963931226394","address":null,"description":"مهندس","photo":"1731522366_6734ef3eb338f.webp","category_id":null,"token_expires":0,"is_verified":1,"error_login":0,"is_company":0}}]
/// pagination : {"total_items":11,"total_pages":2,"current_page":1,"per_page":10}

ItemSearchResult dataFromJson(String str) => ItemSearchResult.fromJson(json.decode(str));
String dataToJson(ItemSearchResult data) => json.encode(data.toJson());
class ItemSearchResult {
  ItemSearchResult({
      List<AdData>? data,
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  ItemSearchResult.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AdData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<AdData>? _data;
  Pagination? _pagination;
ItemSearchResult copyWith({  List<AdData>? data,
  Pagination? pagination,
}) => ItemSearchResult(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<AdData>? get data => _data;
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

