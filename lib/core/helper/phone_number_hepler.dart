
import 'package:easy_localization/easy_localization.dart';

/// Eng.Nour Othman(meory)*


abstract class PhoneNumberHelper{
  static String formatPhoneNumberWithCountyCode(String phone){
    print(phone);
    if((phone).isEmpty) return " ";
    String newPhone = phone.trim().replaceAll(" ", "");
    String formatedPhone = newPhone;

    if(newPhone[0]=="0"){
      formatedPhone= newPhone.substring(1);
      print(formatedPhone);
      print('fffffffffffffff');
    }
    return '+963$formatedPhone';
  }
  static String formatPhoneNumberWithoutCountyCode(String phone){
    if((phone).isEmpty) return "";
    String formatedPhone = "";
      formatedPhone= phone.substring(4);
    return '0$formatedPhone';
  }

}