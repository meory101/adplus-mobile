import 'dart:convert';

UpdateUsernameRequestEntity updateUsernameRequestEntityFromJson(String str) =>
    UpdateUsernameRequestEntity.fromJson(json.decode(str));

String updateUsernameRequestEntityToJson(UpdateUsernameRequestEntity data) =>
    json.encode(data.toJson());

class UpdateUsernameRequestEntity {
  String? _username;
  String? _platform;   

  UpdateUsernameRequestEntity({String? username, String? platform}) {
    _username = username;
    _platform = platform;  
  }

  UpdateUsernameRequestEntity.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _platform = json['platform'];   
  }

  String? get username => _username;
  String? get platform => _platform;

  set username(String? value) => _username = value;
  set platform(String? value) => _platform = value;   

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['platform'] = _platform;   
    return map;
  }

   UpdateUsernameRequestEntity copyWith({String? username, String? platform}) {
    return UpdateUsernameRequestEntity(
      username: username ?? _username,
      platform: platform ?? _platform,
    );
  }
}
