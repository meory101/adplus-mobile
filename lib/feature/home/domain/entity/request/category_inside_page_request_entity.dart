import 'dart:convert';
/// category_id : 3

CategoryInsidePageRequestEntity categoryInsidePageRequestEntityFromJson(String str) => CategoryInsidePageRequestEntity.fromJson(json.decode(str));
String categoryInsidePageRequestEntityToJson(CategoryInsidePageRequestEntity data) => json.encode(data.toJson());
class CategoryInsidePageRequestEntity {
  CategoryInsidePageRequestEntity({
      num? categoryId,}){
    _categoryId = categoryId;
}

  CategoryInsidePageRequestEntity.fromJson(dynamic json) {
    _categoryId = json['category_id'];
  }
  num? _categoryId;
CategoryInsidePageRequestEntity copyWith({  num? categoryId,
}) => CategoryInsidePageRequestEntity(  categoryId: categoryId ?? _categoryId,
);
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    return map;
  }

}