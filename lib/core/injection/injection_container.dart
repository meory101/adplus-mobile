import 'package:get_it/get_it.dart';
import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/advertisement/data/repository/advertisement_repository_impl.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/add_advertisement_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_category_attributes_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_cities_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
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
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/data/repository/home_repository_implements.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_advs_by_attribute_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_categories_usecase.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_category_inside_page_usecase.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/category_inside_page_cubit/category_inside_page_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit/get_categories_cubit.dart';
import 'package:mzad_damascus/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:mzad_damascus/feature/profile/data/repository/profile_repository_implements.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/get_profile_info_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_image_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_profile_usecase.dart';
import 'package:mzad_damascus/feature/profile/domain/usecase/update_username_usecase.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_username_cubit/update_username_cubit.dart';

/// Eng.Nour Othman(meory)*

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GetCategoriesCubit(usecase: sl()));
  sl.registerFactory(() => AdvsByAttributeCubit(usecase: sl()));
  sl.registerFactory(() => CategoryInsidePageCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetCategoriesUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAdvsByAttributeUsecase(repository: sl()));
  sl.registerLazySingleton(
      () => GetCategoryInsidePageUsecase(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplements(remote: sl()));
  sl.registerLazySingleton<HomeRemote>(() => HomeRemoteImplement());

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
  sl.registerFactory(() => GetProfileInfoCubit(usecase: sl()));
  sl.registerFactory(() => UpdateProfileImageCubit(usecase: sl()));
  sl.registerFactory(() => UpdateProfileCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetProfileInfoUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileImageUsecase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(repository: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImplements(remote: sl()));
  sl.registerLazySingleton<ProfileRemote>(() => ProfileRemoteImplement());
}
