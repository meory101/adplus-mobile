import 'dart:convert';

/// page : 1

MyFollowersRequestEntity myFollowersRequestEntityFromJson(String str) => 
    MyFollowersRequestEntity.fromJson(json.decode(str));
String myFollowersRequestEntityToJson(MyFollowersRequestEntity data) => 
    json.encode(data.toJson());

class MyFollowersRequestEntity {
  MyFollowersRequestEntity({
    int? page,
  }) {
    _page = page;
  }

  int? _page;

  MyFollowersRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }

  MyFollowersRequestEntity copyWith({
    int? page,
  }) => 
    MyFollowersRequestEntity(
      page: page ?? _page,
    );

  // Getter
  int? get page => _page;

  // Setter
  set page(int? value) => _page = value;
}