import 'dart:convert';
/// page : 1

CommentsRequestEntity commentsRequestEntityFromJson(String str) => CommentsRequestEntity.fromJson(json.decode(str));
String commentsRequestEntityToJson(CommentsRequestEntity data) => json.encode(data.toJson());
class CommentsRequestEntity {
  CommentsRequestEntity({
      num? page,}){
    _page = page;
}

  set page(num? value) {
    _page = value;
  }

  CommentsRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }
  num? _page;
CommentsRequestEntity copyWith({  num? page,
}) => CommentsRequestEntity(  page: page ?? _page,
);
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

}