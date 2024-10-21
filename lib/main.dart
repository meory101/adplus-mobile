import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'core/helper/app_info_helper.dart';
import 'core/resource/constant_manager.dart';
import 'core/resource/key_manger.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/storage/shared/shared_pref.dart';

/// Eng.Nour Othman(meory)*

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await PackageInfo.fromPlatform().then((value) {
    AppInfoHelper.packageInfo = value;
  });

  // await FirebaseHelper.init();
  // await FlutterLocalNotificationHelper.init();

  SharedPreferences shPref = await SharedPreferences.getInstance();
  AppSharedPreferences.init(shPref);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        //Ar Local
        Locale(
          AppKeyManager.arabicLocalizationCode,
        ),
        //En Local
        Locale(
          AppKeyManager.englishLocalizationCode,
        ),
      ],
      path: AppConstantManager.assetTranslationPath,
      fallbackLocale: const Locale(
        AppKeyManager.arabicLocalizationCode,
      ),
      startLocale: Locale(AppSharedPreferences.getLanguage()),
      child: const MzadApp(),
    ),
  );
}





