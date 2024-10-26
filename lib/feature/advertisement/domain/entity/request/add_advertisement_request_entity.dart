import 'dart:convert';

import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';

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
      String? name, 
      num? startingPrice, 
      num? minIncreasePrice, 
      String? description, 
      num? keywords, 
      String? bidingStartTime,
    List<AttributeFormValue>? attributes,}){
    _categoryId = categoryId;
    _cityId = cityId;
    _name = name;
    _startingPrice = startingPrice;
    _minIncreasePrice = minIncreasePrice;
    _description = description;
    _keywords = keywords;
    _bidingStartTime = bidingStartTime;
    _attributes = attributes;
}

  AddAdvertisementRequestEntity.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _cityId = json['city_id'];
    _name = json['name'];
    _startingPrice = json['starting_price'];
    _minIncreasePrice = json['min_increase_price'];
    _description = json['description'];
    _keywords = json['keywords'];
    _bidingStartTime = json['biding_start_time'];
    _attributes = json['attributes'];
  }
  num? _categoryId;
  num? _cityId;
  String? _name;
  num? _startingPrice;
  num? _minIncreasePrice;
  String? _description;
  num? _keywords;
  String? _bidingStartTime;
  List<AttributeFormValue>? _attributes;
AddAdvertisementRequestEntity copyWith({  num? categoryId,
  num? cityId,
  String? name,
  num? startingPrice,
  num? minIncreasePrice,
  String? description,
  num? keywords,
  String? bidingStartTime,
  dynamic attributes,
}) => AddAdvertisementRequestEntity(  categoryId: categoryId ?? _categoryId,
  cityId: cityId ?? _cityId,
  name: name ?? _name,
  startingPrice: startingPrice ?? _startingPrice,
  minIncreasePrice: minIncreasePrice ?? _minIncreasePrice,
  description: description ?? _description,
  keywords: keywords ?? _keywords,
  bidingStartTime: bidingStartTime ?? _bidingStartTime,
  attributes: attributes ?? _attributes,
);
  num? get categoryId => _categoryId;
  num? get cityId => _cityId;
  String? get name => _name;
  num? get startingPrice => _startingPrice;
  num? get minIncreasePrice => _minIncreasePrice;
  String? get description => _description;
  num? get keywords => _keywords;
  String? get bidingStartTime => _bidingStartTime;
  List<AttributeFormValue>? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['city_id'] = _cityId;
    map['name'] = _name;
    map['starting_price'] = _startingPrice;
    map['min_increase_price'] = _minIncreasePrice;
    map['description'] = _description;
    map['keywords'] = _keywords;
    map['biding_start_time'] = _bidingStartTime;
    map['attributes'] = _attributes;
    return map;
  }

  set attributes(List<AttributeFormValue>? value) {
    print(value);
    print('model value');
    _attributes = value;
  }

  set bidingStartTime(String? value) {
    _bidingStartTime = value;
  }

  set keywords(num? value) {
    _keywords = value;
  }

  set description(String? value) {
    _description = value;
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


