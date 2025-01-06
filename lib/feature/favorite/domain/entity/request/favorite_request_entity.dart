import 'dart:convert';
/// item_id : 0

FavoriteRequestEntity favoriteRequestEntityFromJson(String str) => FavoriteRequestEntity.fromJson(json.decode(str));
String favoriteRequestEntityToJson(FavoriteRequestEntity data) => json.encode(data.toJson());
class FavoriteRequestEntity {
  FavoriteRequestEntity({
      num? itemId,}){
    _itemId = itemId;
}

  FavoriteRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
  }
  num? _itemId;
FavoriteRequestEntity copyWith({  num? itemId,
}) => FavoriteRequestEntity(  itemId: itemId ?? _itemId,
);
  num? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    return map;
  }

}