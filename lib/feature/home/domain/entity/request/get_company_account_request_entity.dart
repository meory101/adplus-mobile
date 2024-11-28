import 'dart:convert';
/// category_id : 2

GetCompanyAccountRequestEntity getCompanyAccountRequestEntityFromJson(String str) => GetCompanyAccountRequestEntity.fromJson(json.decode(str));
String getCompanyAccountRequestEntityToJson(GetCompanyAccountRequestEntity data) => json.encode(data.toJson());
class GetCompanyAccountRequestEntity {
  GetCompanyAccountRequestEntity({
      num? categoryId,}){
    _categoryId = categoryId;
}

  GetCompanyAccountRequestEntity.fromJson(dynamic json) {
    _categoryId = json['category_id'];
  }
  num? _categoryId;
GetCompanyAccountRequestEntity copyWith({  num? categoryId,
}) => GetCompanyAccountRequestEntity(  categoryId: categoryId ?? _categoryId,
);
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    return map;
  }

}