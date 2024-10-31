import 'dart:convert';

PasswordResetRequestEntity passwordResetRequestEntityFromJson(String str) =>
    PasswordResetRequestEntity.fromJson(json.decode(str));
String passwordResetRequestEntityToJson(PasswordResetRequestEntity data) =>
    json.encode(data.toJson());

class PasswordResetRequestEntity {
  PasswordResetRequestEntity({
    String? username,
    String? code,
    String? password,
    String? passwordConfirmation,
  }) {
    _username = username;
    _code = code;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  PasswordResetRequestEntity.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _code = json['code'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  String? _username;
  String? _code;
  String? _password;
  String? _passwordConfirmation;

  PasswordResetRequestEntity copyWith({
    String? username,
    String? code,
    String? password,
    String? passwordConfirmation,
  }) =>
      PasswordResetRequestEntity(
        username: username ?? _username,
        code: code ?? _code,
        password: password ?? _password,
        passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
      );

  String? get username => _username;
  set username(String? value) => _username = value;

  String? get code => _code;
  set code(String? value) => _code = value;

  String? get password => _password;
  set password(String? value) => _password = value;

  String? get passwordConfirmation => _passwordConfirmation;
  set passwordConfirmation(String? value) => _passwordConfirmation = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['code'] = _code;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}
