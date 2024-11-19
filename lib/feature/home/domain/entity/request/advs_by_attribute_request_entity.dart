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
      List<Attributes>? attributes,}){
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
        _attributes?.add(Attributes.fromJson(v));
      });
    }
  }
  num? _page;
  num? _cityId;
  List<Attributes>? _attributes;
AdvsByAttributeRequestEntity copyWith({  num? page,
  List<Attributes>? attributes,
}) => AdvsByAttributeRequestEntity(  page: page ?? _page,
  attributes: attributes ?? _attributes,
);
  num? get page => _page;
  num? get cityId => _cityId;
  List<Attributes>? get attributes => _attributes;

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

  set attributes(List<Attributes>? value) {
    _attributes = value;
  }
}
