import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/theme/app_theme.dart';
import '../router/router.dart';


/// Eng.Nour Othman(meory)*

final GlobalKey<NavigatorState> myAppKey = GlobalKey<NavigatorState>();

class SoaFuel extends StatefulWidget {
  const SoaFuel({super.key});

  @override
  State<SoaFuel> createState() => _InanaaState();
}

class _InanaaState extends State<SoaFuel> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
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
