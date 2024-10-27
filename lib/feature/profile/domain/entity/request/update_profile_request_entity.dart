import 'dart:convert';
/// name : "Murad"
/// username : "murad.client"
/// email : "string"
/// phone : "string"
/// whatsapp : "string"

UpdateProfileRequestEntity updateProfileRequestEntityFromJson(String str) => UpdateProfileRequestEntity.fromJson(json.decode(str));
String updateProfileRequestEntityToJson(UpdateProfileRequestEntity data) => json.encode(data.toJson());
class UpdateProfileRequestEntity {
  UpdateProfileRequestEntity({
      String? name, 
      String? username, 
      String? email, 
      String? phone, 
      String? whatsapp,}){
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _whatsapp = whatsapp;
}

  UpdateProfileRequestEntity.fromJson(dynamic json) {
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _whatsapp = json['whatsapp'];
  }
  String? _name;
  String? _username;
  String? _email;
  String? _phone;
  String? _whatsapp;
UpdateProfileRequestEntity copyWith({  String? name,
  String? username,
  String? email,
  String? phone,
  String? whatsapp,
}) => UpdateProfileRequestEntity(  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  phone: phone ?? _phone,
  whatsapp: whatsapp ?? _whatsapp,
);
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  String? get whatsapp => _whatsapp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['whatsapp'] = _whatsapp;
    return map;
  }

}