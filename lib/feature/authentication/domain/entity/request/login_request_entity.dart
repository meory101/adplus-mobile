  import 'dart:convert';
  /// username : "+963999999999"
  /// password : "P@ssw0rd123"
  /// auth_code : "12345"

  LoginRequestEntity loginRequestEntityFromJson(String str) => LoginRequestEntity.fromJson(json.decode(str));
  String loginRequestEntityToJson(LoginRequestEntity data) => json.encode(data.toJson());
  class LoginRequestEntity {
    LoginRequestEntity({
        String? username, 
        String? password, 
        String? authCode,}){
      _username = username;
      _password = password;
      _authCode = authCode;
  }

    LoginRequestEntity.fromJson(dynamic json) {
      _username = json['username'];
      _password = json['password'];
      _authCode = json['auth_code'];
    }
    String? _username;
    String? _password;
    String? _authCode;
  LoginRequestEntity copyWith({  String? username,
    String? password,
    String? authCode,
  }) => LoginRequestEntity(  username: username ?? _username,
    password: password ?? _password,
    authCode: authCode ?? _authCode,
  );
    String? get username => _username;

    set username(String? value) {
      _username = value;
    }

    String? get password => _password;
    String? get authCode => _authCode;

    Map<String, dynamic> toJson() {
      final map = <String, dynamic>{};
      map['username'] = _username;
      map['password'] = _password;
      map['auth_code'] = _authCode;
      return map;
    }

    set password(String? value) {
      _password = value;
    }

    set authCode(String? value) {
      _authCode = value;
    }
  }