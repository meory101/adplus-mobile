import 'dart:convert';
/// category_id : 11

GetCategoryAttributesRequestEntity getCategoryAttributesRequestEntityFromJson(String str) => GetCategoryAttributesRequestEntity.fromJson(json.decode(str));
String getCategoryAttributesRequestEntityToJson(GetCategoryAttributesRequestEntity data) => json.encode(data.toJson());
class GetCategoryAttributesRequestEntity {
  GetCategoryAttributesRequestEntity({
      num? categoryId,}){
    _categoryId = categoryId;
}

  GetCategoryAttributesRequestEntity.fromJson(dynamic json) {
    _categoryId = json['category_id'];
  }
  num? _categoryId;
GetCategoryAttributesRequestEntity copyWith({  num? categoryId,
}) => GetCategoryAttributesRequestEntity(  categoryId: categoryId ?? _categoryId,
);
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    return map;
  }

}