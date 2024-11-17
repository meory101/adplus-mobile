import 'dart:convert';
/// page : 1

FavoritesRequestEntity favoritesRequestEntityFromJson(String str) => FavoritesRequestEntity.fromJson(json.decode(str));
String favoritesRequestEntityToJson(FavoritesRequestEntity data) => json.encode(data.toJson());
class FavoritesRequestEntity {
  FavoritesRequestEntity({
      num? page,}){
    _page = page;
}

  FavoritesRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
FavoritesRequestEntity copyWith({  num? page,
}) => FavoritesRequestEntity(  page: page ?? _page,
);
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}