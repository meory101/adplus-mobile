import 'package:package_info_plus/package_info_plus.dart';

/// Eng.Nour Othman(meory)*


abstract class AppInfoHelper {
  static PackageInfo? packageInfo;


  static String getAppVersion() {
    return packageInfo?.version ?? "";
  }
  static String getAppBuildNumber() {
    return packageInfo?.buildNumber ?? "";
  }
}
