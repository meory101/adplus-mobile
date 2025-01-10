import 'dart:core';

import 'package:mzad_damascus/app/app.dart';

/// Eng.Nour Othman(meory)*


extension EmailValidation on String {
  bool isEmail() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(this);
  }
}
  extension PhoneNumberValidation on String {
    bool isPhoneNumber() {

      return RegExp(
          r'^[0-9]{10,15}$')
          .hasMatch(this);
    }
  }
  extension PasswordValidation on String {
  bool isValidPassword() {
    return length >= 8;
  }

}

