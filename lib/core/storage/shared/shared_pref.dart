import 'package:shared_preferences/shared_preferences.dart';

import '../../resource/key_manger.dart';

abstract class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

  static clear() {
    _sharedPreferences.clear();
  }


  static cashLanguage({required String language}) {
    _sharedPreferences.setString(AppKeyManager.language, language);
  }
  static cashToken({required String token}) {
    _sharedPreferences.setString(AppKeyManager.token, token);
  }
  static cashAccountType({required String accountType}) {
    //0 user 1 company
    _sharedPreferences.setString(AppKeyManager.accountType, accountType);
  }


  static String getLanguage() {
    return _sharedPreferences.getString(AppKeyManager.language) ?? "ar";
  }
  static String getAccountType() {
    return _sharedPreferences.getString(AppKeyManager.accountType) ?? '';
  }

  static String getToken() {
    return _sharedPreferences.getString(AppKeyManager.token) ?? '';
  }
}
