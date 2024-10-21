import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;

/// Eng.Nour Othman(meory)*

abstract class RouteNamedScreens {
  static String init = mainBottomAppBar;
  static const String mainBottomAppBar = "/main-bottom-app-bar";
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.mainBottomAppBar:
        return FadeBuilderRoute(page: BlocProvider(
          create: (context) => di.sl<GetCategoriesCubit>()..getCategories(context: context),
          child: MainBottomAppBar(),
        ));
    }
    return FadeBuilderRoute(page: const NotFoundScreen());
  }
}

abstract class CurrentRoute {
  static String? currentRouteName;

  CurrentRoute({required String currentRouteName});
}
