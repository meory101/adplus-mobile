import 'dart:convert';
/// page : 1

BannersRequestEntity bannersRequestEntityFromJson(String str) => BannersRequestEntity.fromJson(json.decode(str));
String bannersRequestEntityToJson(BannersRequestEntity data) => json.encode(data.toJson());
class BannersRequestEntity {
  BannersRequestEntity({
      num? page,}){
    _page = page;
}

  BannersRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
BannersRequestEntity copyWith({  num? page,
}) => BannersRequestEntity(  page: page ?? _page,
);
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}