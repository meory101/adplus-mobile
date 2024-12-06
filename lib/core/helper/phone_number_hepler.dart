abstract class PhoneNumberHelper{
  static String formatPhoneNumberWithCountyCode(String phone){
    String formatedPhone = "";
    if(phone[0]=="0"){
      formatedPhone= phone.substring(1);
    }
    return '+963${formatedPhone}';
  }
  static String formatPhoneNumberWithoutCountyCode(String phone){
    String formatedPhone = "";
      formatedPhone= phone.substring(4);
    return '0${formatedPhone}';
  }

}