import 'dart:convert';
/// item_id : 0
/// comment : "string"

AddCommentRequestEntity addCommentRequestEntityFromJson(String str) => AddCommentRequestEntity.fromJson(json.decode(str));
String addCommentRequestEntityToJson(AddCommentRequestEntity data) => json.encode(data.toJson());
class AddCommentRequestEntity {
  AddCommentRequestEntity({
      num? itemId, 
      String? comment,}){
    _itemId = itemId;
    _comment = comment;
}

  AddCommentRequestEntity.fromJson(dynamic json) {
    _itemId = json['item_id'];
    _comment = json['comment'];
  }
  num? _itemId;
  String? _comment;
AddCommentRequestEntity copyWith({  num? itemId,
  String? comment,
}) => AddCommentRequestEntity(  itemId: itemId ?? _itemId,
  comment: comment ?? _comment,
);
  num? get itemId => _itemId;
  String? get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['comment'] = _comment;
    return map;
  }

}