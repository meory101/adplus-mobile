import 'dart:convert';

EditPasswordRequestEntity editPasswordRequestEntityFromJson(String str) =>
    EditPasswordRequestEntity.fromJson(json.decode(str));

String editPasswordRequestEntityToJson(EditPasswordRequestEntity data) =>
    json.encode(data.toJson());

class EditPasswordRequestEntity {
  String? _password;
  String? _passwordConfirmation;

  EditPasswordRequestEntity({
    String? password,
    String? passwordConfirmation,
  }) {
    _password = password;
    _passwordConfirmation = passwordConfirmation;
  }

  EditPasswordRequestEntity.fromJson(Map<String, dynamic> json) {
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

  // Getters and Setters
  String? get password => _password;
  set password(String? value) => _password = value;

  String? get passwordConfirmation => _passwordConfirmation;
  set passwordConfirmation(String? value) => _passwordConfirmation = value;
}
