import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/navigation/slid_left_builder_route.dart';
import 'package:mzad_damascus/core/navigation/slid_up_builder_route.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/get_category_attributes_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/update_adv_cubit/update_advertisement_cubit.dart';
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
import 'package:mzad_damascus/feature/comment/presentation/cubit/comment_cubit/comment_cubit.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/add_favorite_uscase.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/check_favorite_usecase.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/remove_favorite_cubit/remove_favorite_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/check_like_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_advs_by_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/banners_cubit/banners_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_advs_by_user_cubit/get_adv_by_user_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/search_user/search_user_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/category_inside_page_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/inside_page_category_advs_screen.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/search_user.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_password_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_username_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/my_item_screen.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/add_follow_cubit/add_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/profile_by_username_cubit/profile_by_username_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_info_modification_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/verfiy_username_screen.dart';
import 'package:nested/nested.dart';
import '../core/navigation/fade_builder_route.dart';
import '../core/widget/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;
import '../feature/advertisement/presentation/screen/advertisement_category_screen.dart';
import '../feature/advertisement/presentation/screen/advertisement_language_screen.dart';
import '../feature/authentication/presentation/screen/login_screen.dart';
import '../feature/authentication/presentation/screen/register_screen.dart';
import '../feature/favorite/domain/entity/request/favorites_request_entity.dart';
import '../feature/favorite/presentation/cubit/check_favorite_cubit/check_favorite_cubit.dart';
import '../feature/home/presentation/cubit/check_like_cubit/check_like_cubit.dart';
import '../feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import '../feature/home/presentation/cubit/remove_like/remove_like_cubit.dart';
import '../feature/intro/presentation/screen/splash_screen.dart';
import '../feature/likes/presentation/cubit/likes_cubit/likes_cubit.dart';
import '../feature/more/presentation/cubit/myitem_under_review/myitem_under_review_cubit.dart';
import '../feature/more/presentation/screen/favorites_screen.dart';
import '../feature/more/presentation/screen/update_adv_screen.dart';
import '../feature/profile/presentation/cubit/check_follow_cubit/check_follow_cubit.dart';
import '../feature/profile/presentation/cubit/remove_follow_cubit/remove_follow_cubit.dart';

/// Eng.Nour Othman(meory)*

abstract class RouteNamedScreens {
  static String init = splash;
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
  static const String myitem = "/myitem";
  static const String authorProfile = '/author-profile';
  static const String favorites = '/favorites';
  static const String updateAdvs = '/update-Advs';
  static const String searchUser = '/search-user';
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.splash:
        return FadeBuilderRoute(page: const SplashScreen());
      case RouteNamedScreens.profile:
        return FadeBuilderRoute(page: const ProfileScreen());

      case RouteNamedScreens.searchUser:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<ProfileByUsernameCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<SearchUserCubit>(),
              ),
            ],
            child: const SearchUserScreen(),
          ),
        );

      case RouteNamedScreens.insidePageCategoryAdvs:
        argument as InsidePageCategoryAdvArgs;
        return FadeBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<AdvsByAttributeCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  di.sl<GetCitiesCubit>()..getCities(context: context),
            ),
            BlocProvider(
              create: (context) => di.sl<GetCategoryAttributesCubit>()
                ..getCategoryAttributes(
                    context: context,
                    entity: GetCategoryAttributesRequestEntity(
                      categoryId: argument.categoryId,
                    )),
            ),
          ],
          child: InsidePageCategoryAdvsScreen(
            args: argument,
          ),
        ));

      case RouteNamedScreens.favorites:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<FavoritesCubit>()
                  ..getMyFavorites(
                      context: context,
                      entity: MyFavoritesRequestEntity(page: 1)),
              ),
            ],
            child: const FavoritesScreen(),
          ),
        );
      case RouteNamedScreens.myitem:
        return FadeBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<MyitemCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<MyitemUnderReviewCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<MyitemReviewCubit>(),
            ),
          ],
          child: const MyItemsScreen(),
        ));
      case RouteNamedScreens.updateAdvs:
        argument as UpdateAdvArgs;
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<UpdateAdvertisementCubit>(),
              ),
              BlocProvider(
                create: (context) => di.sl<MyitemCubit>(),
              ),
              BlocProvider(
                create: (context) =>
                    di.sl<GetCitiesCubit>()..getCities(context: context),
              ),
            ],
            child: UpdateAdvScreen(
              args: argument,
            ),
          ),
        );

      case RouteNamedScreens.login:
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
          child: const LoginScreen(),
        ));
      case RouteNamedScreens.authorProfile:
        argument as AuthorProfileArgs;
        return FadeBuilderRoute(
            page: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<MyFollowingCubit>()
                ..getMyFollowing(
                  context: context,
                  entity: MyFollowingRequestEntity(page: 1),
                ),
            ),
            BlocProvider(
              create: (context) => di.sl<AddFollowCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<CheckFollowCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<RemoveFollowCubit>(),
            ),
            BlocProvider(create: (context) => di.sl<GetAdvByUserCubit>()),
            BlocProvider(
                create: (context) => di.sl<ProfileByUsernameCubit>()
                  ..getProfileByUsername(
                      context: context,
                      entity: ProfileByUsernameRequestEntity(
                          username: argument.userName))),
          ],
          child: AuthorProfileScreen(
            arg: argument,
          ),
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
              create: (context) => di.sl<AddReactionCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<RemoveLikeCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<CheckLikeCubit>()
                ..checkLike(
                    context: context,
                    entity: CheckLikeRequestEntity(
                        itemId: argument.advertisement?.itemId)),
            ),
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
            BlocProvider(
              create: (context) => di.sl<CheckFavoriteCubit>()
                ..checkFavorite(
                    context: context,
                    entity: FavoriteRequestEntity(
                        itemId: argument.advertisement?.itemId)),
            ),
            BlocProvider(
              create: (context) => di.sl<AddFavoriteCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<RemoveFavoriteCubit>(),
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
                create: (context) => di.sl<BannersCubit>(),
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
          providers: <SingleChildWidget>[
            BlocProvider(
              create: (context) => di.sl<BannersCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<CommentCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<LikesCubit>(),
            ),
            BlocProvider(
              create: (context) => di.sl<FavoritesCubit>()
                ..getMyFavorites(
                    context: context,
                    entity: MyFavoritesRequestEntity(page: 1)),
            ),
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
            BlocProvider(create: (context) => di.sl<MyitemCubit>()),
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
