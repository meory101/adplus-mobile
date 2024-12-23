import 'dart:convert';

import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';

import '../../../../home/domain/entity/response/get_adv_details_response_entity.dart';
import 'attribute_form_value.dart';
/// category_id : 4
/// city_id : 3
/// name : "ففففف"
/// starting_price : 200
/// min_increase_price : 100
/// description : "lllllllllllll"
/// keywords : 3
/// biding_start_time : "2024-10-2"
/// attributes : {}

AddAdvertisementRequestEntity addAdvertisementRequestEntityFromJson(String str) => AddAdvertisementRequestEntity.fromJson(json.decode(str));
String addAdvertisementRequestEntityToJson(AddAdvertisementRequestEntity data) => json.encode(data.toJson());
class AddAdvertisementRequestEntity {
  AddAdvertisementRequestEntity({
      num? categoryId, 
      num? cityId, 
      num? currencyId,
      String? name,
      num? startingPrice, 
      num? minIncreasePrice, 
      String? description,
    String? keywords,
      num? biddingStatus,
      num? itemId,
    List<Attributes>? attributes,}){
    _categoryId = categoryId;
    _itemId = itemId;
    _cityId = cityId;
    _name = name;
    _startingPrice = startingPrice;
    _minIncreasePrice = minIncreasePrice;
    _description = description;
    _keywords = keywords;
    _bidingStartTime = biddingStatus;
    _attributes = attributes;
}

  AddAdvertisementRequestEntity.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _currencyId = json['currency_id'];
    _itemId  = json['item_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _startingPrice = json['starting_price'];
    _minIncreasePrice = json['min_increase_price'];
    _description = json['description'];
    _keywords = json['keywords'];
    _bidingStartTime = json['bidding_start_time'];
    _attributes = json['attributes'];
  }
  num? _categoryId;
  num? _currencyId;
  num? _cityId;
  String? _name;
  num? _itemId;
  num? _startingPrice;
  num? _minIncreasePrice;
  String? _description;
  String? _keywords;
  num? _bidingStartTime;
  List<Attributes>? _attributes;
AddAdvertisementRequestEntity copyWith({  num? categoryId,
  num? cityId,
  num? currencyId,
  String? name,
  num? startingPrice,
  num? minIncreasePrice,
  String? description,
  num? itemId,
  String? keywords,
  num? biddingStatus,
  dynamic attributes,
}) => AddAdvertisementRequestEntity(  categoryId: categoryId ?? _categoryId,
  cityId: cityId ?? _cityId,
  itemId: itemId?? _itemId,
  name: name ?? _name,
  currencyId: currencyId ?? _currencyId,
  startingPrice: startingPrice ?? _startingPrice,
  minIncreasePrice: minIncreasePrice ?? _minIncreasePrice,
  description: description ?? _description,
  keywords: keywords ?? _keywords,
  biddingStatus: biddingStatus ?? _bidingStartTime,
  attributes: attributes ?? _attributes,
);
  num? get categoryId => _categoryId;
  num? get itemId => _itemId;
  num? get currencyId => _currencyId;
  num? get cityId => _cityId;
  String? get name => _name;
  num? get startingPrice => _startingPrice;
  num? get minIncreasePrice => _minIncreasePrice;
  String? get description => _description;
  String? get keywords => _keywords;
  num? get biddingStatus => _bidingStartTime;
  List<Attributes>? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['item_id'] = _itemId;

    map['city_id'] = _cityId;
    map['name'] = _name;
  if(_startingPrice!=null){
    map['starting_price'] = _startingPrice;
  }
  if(_currencyId!=null){
    map['currency_id'] = _currencyId;
  }
    map['min_increase_price'] = _minIncreasePrice;
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['bidding_status'] = _bidingStartTime;
    map['attributes'] = _attributes;
    return map;
  }

  set attributes(List<Attributes>? value) {
    _attributes = value;
  }


  set biddingStatus(num? value) {
    _bidingStartTime = value;
  }

  set keywords(String? value) {
    _keywords = value;
  }
  set itemId(num? value) {
    _itemId = value;
  }
  set description(String? value) {
    _description = value;
  }
  set currencyId(num? value) {
    _currencyId = value;
  }
  set minIncreasePrice(num? value) {
    _minIncreasePrice = value;
  }

  set startingPrice(num? value) {
    _startingPrice = value;
  }

  set name(String? value) {
    _name = value;
  }

  set cityId(num? value) {
    _cityId = value;
  }

  set categoryId(num? value) {
    _categoryId = value;
  }
}


