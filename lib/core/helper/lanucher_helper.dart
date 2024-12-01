import 'dart:io';
import 'package:url_launcher/url_launcher.dart';



abstract class UrlLauncherHelper {
  static Future<void> makeCall({required String phoneNumber}) async {
    await launchUrl(Uri.parse("tel://$phoneNumber"));
  }
  static Future<void> sendMessage({required String phoneNumber}) async {
    await launchUrl(Uri.parse("sms://$phoneNumber"));
  }

  static Future<void> openWhatsapp({required String phoneNumber}) async {
    Uri uri = Uri.parse(Platform.isIOS
        ? "https://wa.me/$phoneNumber"
        : "whatsapp://send?phone=$phoneNumber");
    await launchUrl(uri);
  }

  static Future<void> openTelegram({required String phoneNumber}) async {
    Uri uri = Uri.parse("https://t.me/$phoneNumber");
    await launchUrl(uri);
  }

  static Future<void> openFacebook({required String pageId}) async {
    Uri uri = Uri.parse("https://www.facebook.com/profile.php?id=$pageId");
    await launchUrl(uri);
  }

  static Future<void> openInstagram({required String pageName}) async {
    Uri uri = Uri.parse("https://www.instagram.com/$pageName");
    await launchUrl(uri);
  }

  static Future<void> openUrl({required String pageName}) async {
    Uri uri = Uri.parse("https://$pageName");
    await launchUrl(uri);
  }
  static Future<void> openFullyUrl({required String pageName}) async {
    Uri uri = Uri.parse("$pageName");
    await launchUrl(uri);
  }
}
