import 'dart:convert';
/// item_id : 2

GetAdvDetailsRequestEntity getAdvDetailsRequestEntityFromJson(String str) => GetAdvDetailsRequestEntity.fromJson(json.decode(str));
String getAdvDetailsRequestEntityToJson(GetAdvDetailsRequestEntity data) => json.encode(data.toJson());
class GetAdvDetailsRequestEntity {
  GetAdvDetailsRequestEntity({
      num? itemId,}){
    _itemId = itemId;
}

  GetAdvDetailsRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
  }
  num? _itemId;
GetAdvDetailsRequestEntity copyWith({  num? itemId,
}) => GetAdvDetailsRequestEntity(  itemId: itemId ?? _itemId,
);
  num? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    return map;
  }

}