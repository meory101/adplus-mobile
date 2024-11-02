import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/navigation/slid_left_builder_route.dart';
import 'package:mzad_damascus/core/navigation/slid_up_builder_route.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/advertisement_screen.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/reset_password_cubit/reset_password__cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/forget_password_screen.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/reset_password_screen.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/verfication_code.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/category_inside_page_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/inside_page_category_advs_screen.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_password_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_username_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_info_modification_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/verfiy_username_screen.dart';
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
  static String init =
      // mainBottomAppBar;

      AppSharedPreferences.getToken().isEmpty ? register : mainBottomAppBar;
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainBottomAppBar = "/main-bottom-app-bar";
  static const String advertisementLanguage = "/advertisement-language";
  static const String advertisementCategory = "/advertisement-category ";
  static const String categoryAttributeForm = "/category-attribute-form";
  static const String profile = "/profile";
  static const String categoryInsidePage = "/category-inside-page";
  static const String advertisement = "/advertisement";
  static const String insidePageCategoryAdvs = "/inside-page-category-advs";
  static const String profileModification = "/profile-modification";
  static const String advertisementDetails = "/advertisement-details";
  static const String verfication = "/verfication";
  static const String resetpassword = "/resetpassword";
  static const String forgetpassword = "/forgetpassword";
  static const String verfiyusername = "/verfiyusername";
  static const String editusername = "/editusername";
  static const String editpassword = "/editpassword";
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.splash:
        return FadeBuilderRoute(page: const SplashScreen());
      case RouteNamedScreens.profile:
        return FadeBuilderRoute(page: const ProfileScreen());
      case RouteNamedScreens.insidePageCategoryAdvs:
        argument as InsidePageCategoryAdvArgs;
        return FadeBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<AdvsByAttributeCubit>(),
            ),
          ],
          child: InsidePageCategoryAdvsScreen(
            args: argument,
          ),
        ));
      case RouteNamedScreens.login:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
          child: const LoginScreen(),
        ));
      case RouteNamedScreens.editusername:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<UpdateUsernameCubit>(),
          child: const EditUsernameScreen(),
        ));
      case RouteNamedScreens.resetpassword:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<ResetCubit>(),
          child: const ResetPasswordScreen(),
        ));
      case RouteNamedScreens.forgetpassword:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<ForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ));
      case RouteNamedScreens.register:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<RegisterCubit>(),
          child: const RegisterScreen(),
        ));
      case RouteNamedScreens.editpassword:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<EditPasswordCubit>(),
          child: const EditPasswordScreen(),
        ));
      case RouteNamedScreens.verfiyusername:
        argument as VerfiyusernameArgs;

        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<VerfiyUsernameCubit>(),
          child: VerfiyUsernameScreen(
            args: argument,
          ),
        ));
      case RouteNamedScreens.advertisementLanguage:
        return SlidUpBuilderRoute(page: const AdvertisementLanguageScreen());
      case RouteNamedScreens.verfication:
        argument as VerificationCodeArgs;
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<VerficationCubit>(),
          child: VerificationScreen(
            args: argument,
          ),
        ));
      case RouteNamedScreens.advertisementDetails:
        argument as AdvertisementDetailsArgs;

        return SlidUpBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<AdvDetailsCubit>()
                ..getAdvDetails(
                    context: context,
                    entity: GetAdvDetailsRequestEntity(
                        itemId: argument.advertisement?.itemId)),
            ),
            BlocProvider(
              create: (context) => di.sl<GetCommentsCubit>()
                ..getComments(
                    context: context,
                    entity: GetCommentsRequestEntity(
                        page: 1, itemId: argument.advertisement?.itemId)),
            ),
            BlocProvider(
              create: (context) => di.sl<AddCommentCubit>(),
            ),
          ],
          child: AdvertisementDetailsScreen(
            args: argument,
          ),
        ));

      case RouteNamedScreens.advertisementCategory:
        return SlidLeftBuilderRoute(
            page: BlocProvider(
          create: (context) =>
              di.sl<GetCategoriesCubit>()..getCategories(context: context),
          child: const AdvertisementCategoryScreen(),
        ));
      case RouteNamedScreens.categoryInsidePage:
        argument as CategoryInsidePageArgs;
        return SlidLeftBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<CategoryInsidePageCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<AdvsByAttributeCubit>(),
              ),
            ],
            child: CategoryInsidePageScreen(args: argument),
          ),
        );

      case RouteNamedScreens.advertisement:
        return SlidLeftBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  di.sl<GetCitiesCubit>()..getCities(context: context),
            ),
            BlocProvider(
              create: (context) => di.sl<AddAdvertisementCubit>(),
            )
          ],
          child: AdvertisementScreen(),
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
      case RouteNamedScreens.profileModification:
        argument as ProfileInfoModificationArgs;
        return SlidLeftBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<UpdateProfileCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<UpdateProfileImageCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<GetProfileInfoCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<VerfiyUsernameCubit>(),
            ),
          ],
          child: ProfileInfoModificationScreen(
            args: argument,
          ),
        ));
      case RouteNamedScreens.mainBottomAppBar:
        return FadeBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  di.sl<GetCategoriesCubit>()..getCategories(context: context),
            ),
            BlocProvider(create: (context) => di.sl<LogoutCubit>()),
            BlocProvider(
              create: (context) => di.sl<LoginCubit>(),
              child: const LoginScreen(),
            ),
            BlocProvider(create: (context) => di.sl<GetProfileInfoCubit>()),
          ],
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
