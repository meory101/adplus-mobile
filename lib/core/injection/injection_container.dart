import 'package:get_it/get_it.dart';
import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/advertisement/data/repository/advertisement_repository_impl.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/add_advertisement_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/delete_adv_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_category_attributes_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_cities_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/update_adv_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/update_adv_cubit/update_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/authentication/data/datasource/remote/auth_remote.dart';
import 'package:mzad_damascus/feature/authentication/data/repository/auth_repository_implements.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/forget_password_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/login_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/logout_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/register_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:mzad_damascus/feature/authentication/domain/usecase/verfication_usecase.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/reset_password_cubit/reset_password__cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_cubit.dart';
import 'package:mzad_damascus/feature/comment/data/datasource/remote/comment_remote.dart';
import 'package:mzad_damascus/feature/comment/data/repository/comments_repository_impl.dart';
import 'package:mzad_damascus/feature/comment/domain/repository/comments_repository.dart';
import 'package:mzad_damascus/feature/comment/domain/usecase/comments_usecase.dart';
import 'package:mzad_damascus/feature/comment/presentation/cubit/comment_cubit/comment_cubit.dart';
import 'package:mzad_damascus/feature/favorite/data/datasource/remote/favorite_remote.dart';
import 'package:mzad_damascus/feature/favorite/data/repository/favorite_repository_impl.dart';
import 'package:mzad_damascus/feature/favorite/domain/repository/favorite_repository.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/add_favorite_uscase.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/check_favorite_usecase.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/favorites_usecase.dart';
import 'package:mzad_damascus/feature/favorite/domain/usecase/remove_follow_usecase.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/check_favorite_cubit/check_favorite_cubit.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/remove_favorite_cubit/remove_favorite_cubit.dart';
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/data/repository/home_repository_implements.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/add_comment_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_categories_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_category_inside_page_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_comments_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/remove_like_usecase.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/adv_details_cubit/adv_details_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/banners_cubit/banners_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/check_like_cubit/check_like_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_advs_by_user_cubit/get_adv_by_user_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/remove_like/remove_like_cubit.dart';
import 'package:mzad_damascus/feature/likes/data/datasource/remote/likes_remote.dart';
import 'package:mzad_damascus/feature/likes/data/repository/likes_repository_impl.dart';
import 'package:mzad_damascus/feature/likes/domain/repository/likes_repository.dart';
import 'package:mzad_damascus/feature/likes/domain/usecase/liked_advertisements_usecase.dart';
import 'package:mzad_damascus/feature/likes/presentation/cubit/likes_cubit/likes_cubit.dart';
import 'package:mzad_damascus/feature/more/data/remote/more_remote.dart';
import 'package:mzad_damascus/feature/more/data/repository/more_repository_implements.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/edit_password_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/my_reviewd_irem.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_under_review_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/myitem_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/update_username_usecase.dart';
import 'package:mzad_damascus/feature/more/domain/usecase/verfiyusername_usecase.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_under_review/myitem_under_review_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_cubit.dart';
import 'package:mzad_damascus/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:mzad_damascus/feature/profile/data/repository/profile_repository_implements.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/add_follow_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/get_profile_info_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/myfollowers_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/myfollowing_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/profile_by_username_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/remove_follow_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_image_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_usecase.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/add_follow_cubit/add_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/check_follow_cubit/check_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/profile_by_username_cubit/profile_by_username_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/remove_follow_cubit/remove_follow_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_image_cubit/update_profile_image_cubit.dart';
import '../../feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import '../../feature/home/domain/usecase/add_reaction_usecase.dart';
import '../../feature/home/domain/usecase/banners_usecase.dart';
import '../../feature/home/domain/usecase/check_like_usecase.dart';
import '../../feature/home/domain/usecase/get_adv_by_user_usecase.dart';
import '../../feature/home/domain/usecase/get_adv_details_usecase.dart';

import '../../feature/profile/domain/usecase/check_follow_uscase.dart';

/// Eng.Nour Othman(meory)*

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GetCategoriesCubit(usecase: sl()));
  sl.registerFactory(() => DeleteAdvertisementCubit(usecase: sl()));
  sl.registerFactory(() => UpdateAdvertisementCubit(usecase: sl()));
  sl.registerFactory(() => CheckFollowCubit(usecase: sl()));
  sl.registerFactory(() => RemoveFollowCubit(usecase: sl()));
  sl.registerFactory(() => CheckFollowUscase(repository: sl()));
  sl.registerFactory(() => CheckLikeCubit(usecase: sl()));
  sl.registerFactory(() => LikesCubit(usecase: sl()));
  sl.registerFactory(() => LikesUsecase(repository: sl()));
  sl.registerFactory(() => RemoveLikeCubit(usecase: sl()));
  sl.registerFactory(() => BannersCubit(usecase: sl()));
  sl.registerFactory(() => AdvsByAttributeCubit(usecase: sl()));
  sl.registerFactory(() => CategoryInsidePageCubit(usecase: sl()));
  sl.registerFactory(() => GetAdvByUserCubit(usecase: sl()));
  sl.registerFactory(() => GetCommentsCubit(usecase: sl()));
  sl.registerFactory(() => CommentCubit(usecase: sl()));
  sl.registerFactory(() => CommentsUsecase(repository: sl()));
  sl.registerFactory(() => AddReactionCubit(usecase: sl()));
  sl.registerFactory(() => AddCommentCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetCategoriesUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeleteAdvUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateAdvUsecase(repository: sl()));
  sl.registerLazySingleton(() => RemoveFollowUsecase(repository: sl()));
  sl.registerLazySingleton(() => RemoveLikeUsecase(repository: sl()));
  sl.registerLazySingleton(() => CheckLikeUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAdvByUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => AddReactionUsecase(repository: sl()));
  sl.registerLazySingleton(() => BannersUsecase(repository: sl()));
  sl.registerLazySingleton(() => AddCommentUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCommentsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAdvsByAttributeUsecase(repository: sl()));

  sl.registerLazySingleton(
      () => GetCategoryInsidePageUsecase(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplements(remote: sl()));
  sl.registerLazySingleton<HomeRemote>(() => HomeRemoteImplement());
  sl.registerLazySingleton(() => GetAdvDetailsUsecase(repository: sl()));
  sl.registerFactory(() => AdvDetailsCubit(usecase: sl()));
  sl.registerLazySingleton<MoreRepository>(
      () => MoreRepositoryImplements(remote: sl()));

  sl.registerLazySingleton<MoreRemote>(() => MoreRemoteImplement());
  // تسجيلات خدمات الإعلان
  sl.registerFactory(() => GetCategoryAttributesCubit(usecase: sl()));
  sl.registerFactory(() => AddAdvertisementCubit(usecase: sl()));
  sl.registerFactory(() => GetCitiesCubit(usecase: sl()));
  sl.registerLazySingleton(
      () => GetCategoryAttributesUsecase(repository: sl()));
  sl.registerLazySingleton(() => AddAdvertisementUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCitiesUsecase(repository: sl()));
  sl.registerLazySingleton<AdvertisementRepository>(
      () => AdvertisementRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<AdvertisementRemote>(
      () => AdvertisementRemoteImplement());

  sl.registerFactory(() => LoginCubit(usecase: sl()));
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));

  sl.registerFactory(() => RegisterCubit(usecase: sl()));

  sl.registerLazySingleton(() => EditPasswordUsecase(repository: sl()));
  sl.registerFactory(() => EditPasswordCubit(usecase: sl()));

  sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
  ///////////////verfication
  sl.registerFactory(() => VerficationCubit(usecase: sl()));
  sl.registerLazySingleton(() => VerficationUsecase(repository: sl()));
/////////////////
  sl.registerFactory(() => ResetCubit(usecase: sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(repository: sl()));
  sl.registerFactory(() => ForgetPasswordCubit(usecase: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUsecase(repository: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplements(remote: sl()));
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImplement());
  sl.registerFactory(() => LogoutCubit(usecase: sl()));

  sl.registerLazySingleton(() => LogoutUsecase(repository: sl()));
  sl.registerFactory(() => UpdateUsernameCubit(usecase: sl()));
  sl.registerLazySingleton(() => UpdateUsernameUsecase(repository: sl()));

  sl.registerLazySingleton(() => MyitemUsecase(repository: sl()));
  sl.registerFactory(() => MyitemCubit(usecase: sl()));
  sl.registerLazySingleton(() => MyitemUnderReviewUsecase(repository: sl()));
  sl.registerFactory(() => MyitemUnderReviewCubit(usecase: sl()));
  sl.registerLazySingleton(() => MyReviewdIrem(repository: sl()));
  sl.registerFactory(() => MyitemReviewCubit(usecase: sl()));
  sl.registerFactory(() => VerfiyUsernameCubit(usecase: sl()));
  sl.registerFactory(() => ProfileByUsernameCubit(usecase: sl()));
  sl.registerFactory(() => AddFollowCubit(usecase: sl()));
  sl.registerLazySingleton(() => VerfiyusernameUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetProfileByUsernameUsecase(repository: sl()));
  sl.registerLazySingleton(() => AddFollowUsecase(repository: sl()));
  sl.registerFactory(() => GetProfileInfoCubit(usecase: sl()));
  sl.registerFactory(() => UpdateProfileImageCubit(usecase: sl()));
  sl.registerFactory(() => UpdateProfileCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetProfileInfoUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileImageUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(repository: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImplements(remote: sl()));
  sl.registerLazySingleton<ProfileRemote>(() => ProfileRemoteImplement());

  sl.registerFactory(() => MyFollowersCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetMyFollowersUsecase(repository: sl()));
  sl.registerFactory(() => MyFollowingCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetMyFollowingUsecase(repository: sl()));

  sl.registerFactory(() => CheckFavoriteCubit(usecase: sl()));
  sl.registerFactory(() => RemoveFavoriteCubit(usecase: sl()));
  sl.registerFactory(() => AddFavoriteCubit(usecase: sl()));
  sl.registerFactory(() => FavoritesCubit(usecase: sl()));
  sl.registerFactory(() => CheckFavoriteUscase(repository: sl()));
  sl.registerFactory(() => FavoritesUsecase(repository: sl()));
  sl.registerFactory(() => AddFavoriteUscase(repository: sl()));
  sl.registerFactory(() => RemoveFavoriteUscase(repository: sl()));

  sl.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<FavoriteRemote>(() => FavoriteRemoteImplement());

  sl.registerLazySingleton<LikesRepository>(
      () => LikesRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<LikesRemote>(() => LikesRemoteImplement());

  sl.registerLazySingleton<CommentsRepository>(
      () => CommentsRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<CommentRemote>(() => CommentRemoteImplement());
}
