import 'package:flutter/material.dart';

import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';


/// Eng.Nour Othman(meory)*

abstract class RouteNamedScreens {
  static String init = "init";
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
    }
    return FadeBuilderRoute(page: const NotFoundScreen());
  }
}

abstract class CurrentRoute {
  static String? currentRouteName;
  CurrentRoute({required String currentRouteName});
}
