import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/navigation/slid_left_builder_route.dart';
import 'package:mzad_damascus/core/navigation/slid_up_builder_route.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/category_inside_page_screen.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;
import '../feature/advertisement/presentation/screen/advertisement_category_screen.dart';
import '../feature/advertisement/presentation/screen/advertisement_language_screen.dart';
import '../feature/authentication/presentation/screen/login_screen.dart';
import '../feature/authentication/presentation/screen/register_screen.dart';
import '../feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import '../feature/intro/presentation/screen/splash_screen.dart';

/// Eng.Nour Othman(meory)*

abstract class RouteNamedScreens {
  static const String init = mainBottomAppBar;
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainBottomAppBar = "/main-bottom-app-bar";
  static const String advertisementLanguage = "/advertisement-language";
  static const String advertisementCategory = "/advertisement-category ";
  static const String categoryAttributeForm = "/category-attribute-form";
  static const String profile = "/profile";
  static const String categoryInsidePage = "/category-inside-page";
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.splash:
        return FadeBuilderRoute(page: const SplashScreen());
      case RouteNamedScreens.profile:
        return FadeBuilderRoute(page: ProfileScreen());
      case RouteNamedScreens.login:
        return FadeBuilderRoute(page: const LoginScreen());
      case RouteNamedScreens.register:
        return FadeBuilderRoute(page: const RegisterScreen());
      case RouteNamedScreens.advertisementLanguage:
        return SlidUpBuilderRoute(page: const AdvertisementLanguageScreen());
      case RouteNamedScreens.advertisementCategory:
        return SlidLeftBuilderRoute(
            page: BlocProvider(
          create: (context) =>
              di.sl<GetCategoriesCubit>()..getCategories(context: context),
          child: const AdvertisementCategoryScreen(),
        ));
      case RouteNamedScreens.categoryInsidePage:
        argument as  CategoryInsidePageArgs ;
        return SlidLeftBuilderRoute(
            page: BlocProvider(
              create: (context) =>
              di.sl<CategoryInsidePageCubit>(),
              child:  CategoryInsidePageScreen(args: argument),
            ));
      case RouteNamedScreens.categoryAttributeForm:
        argument as CategoryAttributeFormArgs;
        return SlidLeftBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<GetCategoryAttributesCubit>(),
          child: CategoryAttributeFormScreen(
            args: argument,
          ),
        ));

      case RouteNamedScreens.mainBottomAppBar:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) =>
              di.sl<GetCategoriesCubit>()..getCategories(context: context),
          child: const MainBottomAppBar(),
        ));
    }
    return FadeBuilderRoute(page: const NotFoundScreen());
  }
}

abstract class CurrentRoute {
  static String? currentRouteName;

  CurrentRoute({required String currentRouteName});
}
