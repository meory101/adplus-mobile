import 'dart:convert';

VerifyUsernameRequestEntity verifyUsernameRequestEntityFromJson(String str) =>
    VerifyUsernameRequestEntity.fromJson(json.decode(str));

String verifyUsernameRequestEntityToJson(VerifyUsernameRequestEntity data) =>
    json.encode(data.toJson());

class VerifyUsernameRequestEntity {
  String? username;
  String? platform;
  String? verificationCode;

  VerifyUsernameRequestEntity({
    this.username,
    this.platform,
    this.verificationCode,
  });

  VerifyUsernameRequestEntity.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    platform = json['platform'];
    verificationCode = json['verification_code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'platform': platform,
      'verification_code': verificationCode,
    };
  }
}
