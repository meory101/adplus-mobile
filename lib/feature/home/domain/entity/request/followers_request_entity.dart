import 'dart:convert';
/// page : 1
/// username : "othmannour2001@gmail.com"

FollowersRequestEntity followersRequestEntityFromJson(String str) => FollowersRequestEntity.fromJson(json.decode(str));
String followersRequestEntityToJson(FollowersRequestEntity data) => json.encode(data.toJson());
class FollowersRequestEntity {
  FollowersRequestEntity({
      num? page, 
      String? username,}){
    _page = page;
    _username = username;
}

  FollowersRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
    _username = json['username'];
  }
  num? _page;
  String? _username;
FollowersRequestEntity copyWith({  num? page,
  String? username,
}) => FollowersRequestEntity(  page: page ?? _page,
  username: username ?? _username,
);
  num? get page => _page;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['username'] = _username;
    return map;
  }

}