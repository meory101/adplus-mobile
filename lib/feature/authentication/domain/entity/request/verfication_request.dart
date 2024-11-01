import 'dart:convert';

/// تمثيل كيان طلب التحقق VerificationRequestEntity
/// يحتوي على `username`، `password`، و `auth_code`

VerificationRequestEntity verificationRequestEntityFromJson(String str) => VerificationRequestEntity.fromJson(json.decode(str));
String verificationRequestEntityToJson(VerificationRequestEntity data) => json.encode(data.toJson());

class VerificationRequestEntity {
  VerificationRequestEntity({
    String? username,
    String? password,
    String? authCode,
  }) {
    _username = username;
    _password = password;
    _authCode = authCode;
  }

  VerificationRequestEntity.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _authCode = json['auth_code'];
  }

  String? _username;
  String? _password;
  String? _authCode;

  VerificationRequestEntity copyWith({
    String? username,
    String? password,
    String? authCode,
  }) =>
      VerificationRequestEntity(
        username: username ?? _username,
        password: password ?? _password,
        authCode: authCode ?? _authCode,
      );

  String? get username => _username;
  String? get password => _password;
  String? get authCode => _authCode;

  set username(String? value) {
    _username = value;
  }

  set password(String? value) {
    _password = value;
  }

  set authCode(String? value) {
    _authCode = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['auth_code'] = _authCode;
    return map;
  }
}
