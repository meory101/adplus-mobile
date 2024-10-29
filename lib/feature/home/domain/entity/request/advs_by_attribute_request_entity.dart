import 'dart:convert';
/// page : 1
/// attributes : [{"attribute_id":19,"value":"مرسيدس"}]

AdvsByAttributeRequestEntity advsByAttributeRequestEntityFromJson(String str) => AdvsByAttributeRequestEntity.fromJson(json.decode(str));
String advsByAttributeRequestEntityToJson(AdvsByAttributeRequestEntity data) => json.encode(data.toJson());
class AdvsByAttributeRequestEntity {
  AdvsByAttributeRequestEntity({
      num? page, 
      List<Attributes>? attributes,}){
    _page = page;
    _attributes = attributes;
}

  AdvsByAttributeRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
  }
  num? _page;
  List<Attributes>? _attributes;
AdvsByAttributeRequestEntity copyWith({  num? page,
  List<Attributes>? attributes,
}) => AdvsByAttributeRequestEntity(  page: page ?? _page,
  attributes: attributes ?? _attributes,
);
  num? get page => _page;
  List<Attributes>? get attributes => _attributes;

  set page(num? value) {
    _page = value;
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

/// attribute_id : 19
/// value : "مرسيدس"

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      num? attributeId,
      String? value,}){
    _attributeId = attributeId;
    _value = value;
}

  Attributes.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _value = json['value'];
  }
  num? _attributeId;
  String? _value;
Attributes copyWith({  num? attributeId,
  String? value,
}) => Attributes(  attributeId: attributeId ?? _attributeId,
  value: value ?? _value,
);
  num? get attributeId => _attributeId;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attribute_id'] = _attributeId;
    map['value'] = _value;
    return map;
  }

}