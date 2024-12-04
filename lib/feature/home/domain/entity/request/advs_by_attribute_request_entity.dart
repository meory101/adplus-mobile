import 'dart:convert';

import '../response/get_adv_details_response_entity.dart';
/// page : 1
/// attributes : [{"attribute_id":19,"value":"مرسيدس"}]

AdvsByAttributeRequestEntity advsByAttributeRequestEntityFromJson(String str) => AdvsByAttributeRequestEntity.fromJson(json.decode(str));
String advsByAttributeRequestEntityToJson(AdvsByAttributeRequestEntity data) => json.encode(data.toJson());
class AdvsByAttributeRequestEntity {
  AdvsByAttributeRequestEntity({
      num? page,
    num? cityId,
      List<FilterAttribute>? attributes,}){
    _page = page;
    _cityId = cityId;
    _attributes = attributes;
}

  AdvsByAttributeRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
    _cityId = json ['city_id'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(FilterAttribute.fromJson(v));
      });
    }
  }
  num? _page;
  num? _cityId;
  List<FilterAttribute>? _attributes;
AdvsByAttributeRequestEntity copyWith({  num? page,
  List<FilterAttribute>? attributes,
}) => AdvsByAttributeRequestEntity(  page: page ?? _page,
  attributes: attributes ?? _attributes,
);
  num? get page => _page;
  num? get cityId => _cityId;
  List<FilterAttribute>? get attributes => _attributes;

  set page(num? value) {
    _page = value;
  }
  set cityId(num? value) {
    _cityId = value;
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  set attributes(List<FilterAttribute>? value) {
    _attributes = value;
  }
}


FilterAttribute attributesFromJson(String str) =>
    FilterAttribute.fromJson(json.decode(str));

String attributesToJson(FilterAttribute data) => json.encode(data.toJson());

class FilterAttribute {
  FilterAttribute({
    num? attributeId,
    List<String>? value,
  }) {
    _attributeId = attributeId;
    _value = value;
  }

  set itemAttributeId(num? value) {
    _itemAttributeId = value;
  }

  FilterAttribute.fromJson(dynamic json) {
    _itemAttributeId = json['item_attribute_id'];
    _itemId = json['item_id'];
    _attributeId = json['attribute_id'];
    _value = json['value'];
    _attribute = json['attribute'] != null
        ? Attribute.fromJson(json['attribute'])
        : null;
  }

  num? _itemAttributeId;
  num? _itemId;
  num? _attributeId;
  List<String>? _value;
  Attribute? _attribute;

  FilterAttribute copyWith({
    num? itemAttributeId,
    num? itemId,
    num? attributeId,
    List<String>? value,
    Attribute? attribute,
  }) =>
      FilterAttribute(
        attributeId: attributeId ?? _attributeId,
        value: value ?? _value,
      );


  List<String>? get value => _value;

  num? get attributeId => _attributeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_attribute_id'] = _itemAttributeId;
    map['item_id'] = _itemId;
    map['attribute_id'] = _attributeId;
    map['value'] = _value;
    if (_attribute != null) {
      map['attribute'] = _attribute?.toJson();
    }
    return map;
  }

  set itemId(num? value) {
    _itemId = value;
  }

  set attributeId(num? value) {
    _attributeId = value;
  }

  set value(List<String>? value) {
    _value = value;
  }

  set attribute(Attribute? value) {
    _attribute = value;
  }
}
