import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';
import 'core/helper/app_info_helper.dart';
import 'core/resource/constant_manager.dart';
import 'core/resource/key_manger.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/storage/shared/shared_pref.dart';

bool isOpenFromDeepLink = false;
List<String> deepLinkPaths = [];
String? advId;

/// Eng.Nour Othman(meory)*

// void openDeepLinkScreen() {
//   myAppKey.currentState?.pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) {
//         if (deepLinkPaths.length <= 1) {
//           return const Scaffold(
//             body: Text(
//               "Error",
//               style: TextStyle(fontSize: 30, color: AppColorManager.textAppColor),
//             ),
//           );
//         }
//         advId = deepLinkPaths[1];
//         return AdvertisementDetailsScreen(
//           args: AdvertisementDetailsArgs(
//             advertisement: AdData(
//               itemId: num.parse(advId ?? ""),
//             ),
//           ),
//         );
//       }), (route) => false);
//   if (myAppKey.currentState == null) {
//   } else {
//     isOpenFromDeepLink = true;
//     print(deepLinkPaths[1]);
//     myAppKey.currentState?.pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) {
//       if (deepLinkPaths.length <= 1) {
//         return const Scaffold(
//           body: Text(
//             "Error",
//             style: TextStyle(fontSize: 30, color: AppColorManager.textAppColor),
//           ),
//         );
//       }
//       advId = deepLinkPaths[1];
//       return AdvertisementDetailsScreen(
//         args: AdvertisementDetailsArgs(
//           advertisement: AdData(
//             itemId: num.parse(advId ?? ""),
//           ),
//         ),
//       );
//     }), (route) => false);
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await di.init();

  await PackageInfo.fromPlatform().then((value) {
    AppInfoHelper.packageInfo = value;
  });

  SharedPreferences shPref = await SharedPreferences.getInstance();
  AppSharedPreferences.init(shPref);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(AppKeyManager.arabicLocalizationCode),
        Locale(AppKeyManager.englishLocalizationCode),
      ],
      path: AppConstantManager.assetTranslationPath,
      fallbackLocale: const Locale(AppKeyManager.arabicLocalizationCode),
      startLocale: Locale(AppSharedPreferences.getLanguage()),
      child: const MzadApp(),
    ),
  );
}
