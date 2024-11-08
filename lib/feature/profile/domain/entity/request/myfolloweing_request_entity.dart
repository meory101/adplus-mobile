import 'dart:convert';

MyFollowingRequestEntity myFollowingRequestEntityFromJson(String str) => 
    MyFollowingRequestEntity.fromJson(json.decode(str));
String myFollowingRequestEntityToJson(MyFollowingRequestEntity data) => 
    json.encode(data.toJson());

class MyFollowingRequestEntity {
  MyFollowingRequestEntity({
    int? page,
  }) {
    _page = page;
  }

  int? _page;

  MyFollowingRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

  MyFollowingRequestEntity copyWith({
    int? page,
  }) => 
    MyFollowingRequestEntity(
      page: page ?? _page,
    );

  // Getter
  int? get page => _page;

  // Setter
  set page(int? value) => _page = value;
}