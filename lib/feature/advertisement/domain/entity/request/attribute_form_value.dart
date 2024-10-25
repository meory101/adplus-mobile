import 'dart:convert';
/// attribute_id : 1
/// value : ""

AttributeFormValue attributeFormValueFromJson(String str) => AttributeFormValue.fromJson(json.decode(str));
String attributeFormValueToJson(AttributeFormValue data) => json.encode(data.toJson());
class AttributeFormValue {
  AttributeFormValue({
      num? attributeId, 
      String? value,}){
    _attributeId = attributeId;
    _value = value;
}

  AttributeFormValue.fromJson(dynamic json) {
    _attributeId = json['attribute_id'];
    _value = json['value'];
  }
  num? _attributeId;
  String? _value;
AttributeFormValue copyWith({  num? attributeId,
  String? value,
}) => AttributeFormValue(  attributeId: attributeId ?? _attributeId,
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