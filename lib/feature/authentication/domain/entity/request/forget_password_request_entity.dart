import 'dart:convert';

/// username : "user@example.com"
/// client_type : "web"

ForgetPasswordRequestEntity forgetPasswordRequestEntityFromJson(String str) =>
    ForgetPasswordRequestEntity.fromJson(json.decode(str));
String forgetPasswordRequestEntityToJson(ForgetPasswordRequestEntity data) =>
    json.encode(data.toJson());

class ForgetPasswordRequestEntity {
  ForgetPasswordRequestEntity({
    String? username,
    String? platform,
  }) {
    _username = username;
    _platform = platform ?? "web";
  }

  ForgetPasswordRequestEntity.fromJson(dynamic json) {
    _username = json['username'];
    _platform = json['platform'];
  }

  String? _username;
  String? _platform;

  ForgetPasswordRequestEntity copyWith({
    String? username,
    String? platform,
  }) =>
      ForgetPasswordRequestEntity(
        username: username ?? _username,
        platform: platform ?? _platform,
      );

  String? get username => _username;
  set username(String? value) {
    _username = value;
  }

  String? get platform => _platform;
  set platform(String? value) {
    _platform = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['platform'] = _platform;
    return map;
  }
}
