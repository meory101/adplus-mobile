import 'dart:convert';
/// page : 1
/// category_id : 1

AdsByCategoryRequestEntity adsByCategoryRequestEntityFromJson(String str) => AdsByCategoryRequestEntity.fromJson(json.decode(str));
String adsByCategoryRequestEntityToJson(AdsByCategoryRequestEntity data) => json.encode(data.toJson());
class AdsByCategoryRequestEntity {
  AdsByCategoryRequestEntity({
      num? page, 
      num? categoryId,}){
    _page = page;
    _categoryId = categoryId;
}

  set page(num? value) {
    _page = value;
  }

  AdsByCategoryRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
    _categoryId = json['category_id'];
  }
  num? _page;
  num? _categoryId;
AdsByCategoryRequestEntity copyWith({  num? page,
  num? categoryId,
}) => AdsByCategoryRequestEntity(  page: page ?? _page,
  categoryId: categoryId ?? _categoryId,
);
  num? get page => _page;
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['category_id'] = _categoryId;
    return map;
  }

  set categoryId(num? value) {
    _categoryId = value;
  }
}