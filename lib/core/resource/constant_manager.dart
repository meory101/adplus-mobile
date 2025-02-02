

abstract class AppConstantManager {
  static const bool stagingEnv = true;
  static const String assetTranslationPath = 'assets/translations';
  static const String appIpConnectionTest = '8.8.8.8';
  static const String inBaseUrl = "api.mazaddimashq.com";
    static const String outBaseUrl = "api.mzaddimasq.com"; //code
  static const String baseUrl =stagingEnv==true? inBaseUrl : outBaseUrl;
  static const String imageBaseUrl = "https://${AppConstantManager.baseUrl}/images/original/";

}
