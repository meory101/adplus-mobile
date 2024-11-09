import 'dart:convert';

  
 MyItemRequestEntity myItemRequestEntityFromJson(String str) =>
    MyItemRequestEntity.fromJson(json.decode(str));

 String myItemRequestEntityToJson(MyItemRequestEntity data) =>
    json.encode(data.toJson());

class MyItemRequestEntity {
  MyItemRequestEntity({
    num? page,
  }) {
    _page = page;
  }

  num? _page;

   num? get page => _page;

   set page(num? value) {
    _page = value;
  }

   MyItemRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }

   MyItemRequestEntity copyWith({
    num? page,
  }) =>
      MyItemRequestEntity(
        page: page ?? _page,
      );

   Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }
}
