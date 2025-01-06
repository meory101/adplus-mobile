import 'dart:convert';
/// item_id : 0
/// reaction_type : "like"

AddReactionRequestEntity addReactionRequestEntityFromJson(String str) => AddReactionRequestEntity.fromJson(json.decode(str));
String addReactionRequestEntityToJson(AddReactionRequestEntity data) => json.encode(data.toJson());
class AddReactionRequestEntity {
  AddReactionRequestEntity({
      num? itemId, 
      String? reactionType,}){
    _itemId = itemId;
    _reactionType = reactionType;
}

  AddReactionRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
    _reactionType = json['reaction_type'];
  }
  num? _itemId;
  String? _reactionType;
AddReactionRequestEntity copyWith({  num? itemId,
  String? reactionType,
}) => AddReactionRequestEntity(  itemId: itemId ?? _itemId,
  reactionType: reactionType ?? _reactionType,
);
  num? get itemId => _itemId;
  String? get reactionType => _reactionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['reaction_type'] = _reactionType;
    return map;
  }

}