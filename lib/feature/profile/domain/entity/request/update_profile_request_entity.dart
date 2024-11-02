import 'dart:convert';

/// name : "Murad"
/// username : "murad.client"
/// email : "string"
/// phone : "string"
/// whatsapp : "string"
/// description : "string"

UpdateProfileRequestEntity updateProfileRequestEntityFromJson(String str) => UpdateProfileRequestEntity.fromJson(json.decode(str));
String updateProfileRequestEntityToJson(UpdateProfileRequestEntity data) => json.encode(data.toJson());

class UpdateProfileRequestEntity {
  UpdateProfileRequestEntity({
    String? name,
    String? username,
    String? email,
    String? phone,
    String? whatsapp,
    String? description,
  }) {
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _whatsapp = whatsapp;
    _description = description;
  }

  String? _name;
  String? _username;
  String? _email;
  String? _phone;
  String? _whatsapp;
  String? _description;

  UpdateProfileRequestEntity.fromJson(dynamic json) {
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _whatsapp = json['whatsapp'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['whatsapp'] = _whatsapp;
    map['description'] = _description;
    return map;
  }

  UpdateProfileRequestEntity copyWith({
    String? name,
    String? username,
    String? email,
    String? phone,
    String? whatsapp,
    String? description,
  }) => 
    UpdateProfileRequestEntity(
      name: name ?? _name,
      username: username ?? _username,
      email: email ?? _email,
      phone: phone ?? _phone,
      whatsapp: whatsapp ?? _whatsapp,
      description: description ?? _description,
    );

  // Getters
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  String? get whatsapp => _whatsapp;
  String? get description => _description;

  // Setters
  set name(String? value) => _name = value;
  set username(String? value) => _username = value;
  set email(String? value) => _email = value;
  set phone(String? value) => _phone = value;
  set whatsapp(String? value) => _whatsapp = value;
  set description(String? value) => _description = value;
}
