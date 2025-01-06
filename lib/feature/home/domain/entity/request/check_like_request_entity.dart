import 'dart:convert';
/// item_id : 67

CheckLikeRequestEntity checkLikeRequestEntityFromJson(String str) => CheckLikeRequestEntity.fromJson(json.decode(str));
String checkLikeRequestEntityToJson(CheckLikeRequestEntity data) => json.encode(data.toJson());
class CheckLikeRequestEntity {
  CheckLikeRequestEntity({
      num? itemId,}){
    _itemId = itemId;
}

  CheckLikeRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
  }
  num? _itemId;
CheckLikeRequestEntity copyWith({  num? itemId,
}) => CheckLikeRequestEntity(  itemId: itemId ?? _itemId,
);
  num? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    return map;
  }

}