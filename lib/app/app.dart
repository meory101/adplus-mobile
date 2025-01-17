import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../core/theme/app_theme.dart';
import '../main.dart';
import '../router/router.dart';

final GlobalKey<NavigatorState> myAppKey = GlobalKey<NavigatorState>();

class MzadApp extends StatefulWidget {
  const MzadApp({super.key});

  @override
  State<MzadApp> createState() => _InanaaState();
}

class _InanaaState extends State<MzadApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    initUniLinks(context);
    super.initState();
  }

  @override
  dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> initUniLinks(BuildContext context) async {
    _sub = AppLinks().uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        deepLinkPaths = uri.pathSegments;
        advId =
        deepLinkPaths[1];
        openDeepLinkScreen();
      }
    }, onError: (Object err) {
      print(err);
    });

    try {
      final initialLink = await AppLinks().getInitialLink();
      if (initialLink != null) {
        deepLinkPaths = initialLink.pathSegments;
        isOpenFromDeepLink = true;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: lightTheme(),
        navigatorKey: myAppKey,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouteNamedScreens.init,
      );
    });
  }
}
