import 'dart:convert';
/// page : 1
/// item_id : 56

GetCommentsRequestEntity getCommentsRequestEntityFromJson(String str) => GetCommentsRequestEntity.fromJson(json.decode(str));
String getCommentsRequestEntityToJson(GetCommentsRequestEntity data) => json.encode(data.toJson());
class GetCommentsRequestEntity {
  GetCommentsRequestEntity({
      num? page, 
      num? itemId,}){
    _page = page;
    _itemId = itemId;
}

  GetCommentsRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
    _itemId = json['item_id'];
  }
  num? _page;
  num? _itemId;
GetCommentsRequestEntity copyWith({  num? page,
  num? itemId,
}) => GetCommentsRequestEntity(  page: page ?? _page,
  itemId: itemId ?? _itemId,
);
  num? get page => _page;
  num? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['item_id'] = _itemId;
    return map;
  }

}