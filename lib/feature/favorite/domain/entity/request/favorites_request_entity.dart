import 'dart:convert';
/// page : 1

MyFavoritesRequestEntity favoritesRequestEntityFromJson(String str) => MyFavoritesRequestEntity.fromJson(json.decode(str));
String favoritesRequestEntityToJson(MyFavoritesRequestEntity data) => json.encode(data.toJson());
class MyFavoritesRequestEntity {
  MyFavoritesRequestEntity({
      num? page,}){
    _page = page;
}

  MyFavoritesRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
MyFavoritesRequestEntity copyWith({  num? page,
}) => MyFavoritesRequestEntity(  page: page ?? _page,
);
  num? get page => _page;

  set page(num? value) {
    _page = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}