import 'dart:convert';
/// page : 1

LikesRequestEntity likesRequestEntityFromJson(String str) => LikesRequestEntity.fromJson(json.decode(str));
String likesRequestEntityToJson(LikesRequestEntity data) => json.encode(data.toJson());
class LikesRequestEntity {
  LikesRequestEntity({
      num? page,}){
    _page = page;
}

  LikesRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
LikesRequestEntity copyWith({  num? page,
}) => LikesRequestEntity(  page: page ?? _page,
);
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}