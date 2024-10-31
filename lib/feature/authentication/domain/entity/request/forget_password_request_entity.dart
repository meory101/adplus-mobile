import 'dart:convert';

/// username : "user@example.com"
/// client_type : "web"

ForgetPasswordRequestEntity forgetPasswordRequestEntityFromJson(String str) => ForgetPasswordRequestEntity.fromJson(json.decode(str));
String forgetPasswordRequestEntityToJson(ForgetPasswordRequestEntity data) => json.encode(data.toJson());

class ForgetPasswordRequestEntity {
  ForgetPasswordRequestEntity({
    String? username,
    String? clientType,
  }) {
    _username = username;
    _clientType = clientType ?? "web";
  }

  ForgetPasswordRequestEntity.fromJson(dynamic json) {
    _username = json['username'];
    _clientType = json['client_type'];
  }

  String? _username;
  String? _clientType;

  ForgetPasswordRequestEntity copyWith({
    String? username,
    String? clientType,
  }) => 
      ForgetPasswordRequestEntity(
        username: username ?? _username,
        clientType: clientType ?? _clientType,
      );

  String? get username => _username;
  set username(String? value) {
    _username = value;
  }

  String? get clientType => _clientType;
  set clientType(String? value) {
    _clientType = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['client_type'] = _clientType;
    return map;
  }
}
