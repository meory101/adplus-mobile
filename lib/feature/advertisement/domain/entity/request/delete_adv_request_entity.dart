import 'dart:convert';
/// item_id : 1

DeleteAdvRequestEntity deleteAdvRequestEntityFromJson(String str) => DeleteAdvRequestEntity.fromJson(json.decode(str));
String deleteAdvRequestEntityToJson(DeleteAdvRequestEntity data) => json.encode(data.toJson());
class DeleteAdvRequestEntity {
  DeleteAdvRequestEntity({
      num? itemId,}){
    _itemId = itemId;
}

  DeleteAdvRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
  }
  num? _itemId;
DeleteAdvRequestEntity copyWith({  num? itemId,
}) => DeleteAdvRequestEntity(  itemId: itemId ?? _itemId,
);
  num? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    return map;
  }

}