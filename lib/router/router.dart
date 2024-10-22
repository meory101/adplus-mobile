import 'package:flutter/material.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;


/// Eng.Nour Othman(meory)*

abstract class RouteNamedScreens {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainBottomAppBar = "/main-bottom-app-bar";
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.splash:
        return FadeBuilderRoute(page: const SplashScreen());
      case RouteNamedScreens.login:
        return FadeBuilderRoute(page: const LoginScreen());
      case RouteNamedScreens.register:
        return FadeBuilderRoute(page: const RegisterScreen());

      case RouteNamedScreens.mainBottomAppBar:
        return FadeBuilderRoute(page: BlocProvider(
          create: (context) => di.sl<GetCategoriesCubit>()..getCategories(context: context),
          child: MainBottomAppBar(),
        ));
        return FadeBuilderRoute(page: const MainBottomAppBar());
    }
    return FadeBuilderRoute(page: const NotFoundScreen());
  }
}

abstract class CurrentRoute {
  static String? currentRouteName;

  CurrentRoute({required String currentRouteName});
}
