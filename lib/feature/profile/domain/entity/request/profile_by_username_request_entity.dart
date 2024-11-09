import 'dart:convert';

/// username : "murad.client"

ProfileByUsernameRequestEntity profileByUsernameRequestEntityFromJson(String str) => 
    ProfileByUsernameRequestEntity.fromJson(json.decode(str));

String profileByUsernameRequestEntityToJson(ProfileByUsernameRequestEntity data) => 
    json.encode(data.toJson());

class ProfileByUsernameRequestEntity {
  ProfileByUsernameRequestEntity({
    String? username,
  }) {
    _username = username;
  }

  ProfileByUsernameRequestEntity.fromJson(dynamic json) {
    _username = json['username'];
  }

  String? _username;

  ProfileByUsernameRequestEntity copyWith({
    String? username,
  }) => ProfileByUsernameRequestEntity(
    username: username ?? _username,
  );

  String? get username => _username;

  set username(String? value) {
    _username = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    return map;
  }
}