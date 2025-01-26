import 'dart:convert';

RegisterRequestEntity registerRequestEntityFromJson(String str) => RegisterRequestEntity.fromJson(json.decode(str));

String registerRequestEntityToJson(RegisterRequestEntity data) => json.encode(data.toJson());

class RegisterRequestEntity {
  RegisterRequestEntity({
    String? name,
    String? whatsapp,
    String? username,
    String? password,
    String? phone,
    String? passwordConfirmation,
  }) {
    _name = name;
    _whatsapp = whatsapp;
    _username = username;
    _password = password;
    _phone = phone;
    _passwordConfirmation = passwordConfirmation;
  }

  RegisterRequestEntity.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _whatsapp = json['whatsapp'];
    _username = json['username'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  String? _name;
  String? _whatsapp;
  String? _username;
  String? _password;
  String? _passwordConfirmation;
  String? _phone;

  RegisterRequestEntity copyWith({
    String? name,
    String? whatsapp,
    String? username,
    String? password,
    String? passwordConfirmation,
    String? phone
  }) =>
      RegisterRequestEntity(
        phone: phone ?? _phone,
        name: name ?? _name,
        whatsapp: whatsapp ?? _whatsapp,
        username: username ?? _username,
        password: password ?? _password,
        passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
      );

  String? get name => _name;
  set name(String? value) => _name = value;

  String? get phone => _phone;
  set phone(String? value) => _phone = value;


  String? get whatsapp => _whatsapp;
  set whatsapp(String? value) => _whatsapp = value;

  String? get username => _username;
  set username(String? value) => _username = value;

  String? get password => _password;
  set password(String? value) => _password = value;

  String? get passwordConfirmation => _passwordConfirmation;
  set passwordConfirmation(String? value) => _passwordConfirmation = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['whatsapp'] = _whatsapp;
    map['phone'] = _phone;
    map['username'] = _username;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }
}
