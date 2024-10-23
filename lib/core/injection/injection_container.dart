import 'package:get_it/get_it.dart';
import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/advertisement/data/repository/advertisement_repository_impl.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import 'package:mzad_damascus/feature/advertisement/domain/usecase/get_category_attributes_usecase.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/data/repository/home_repository_implements.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import 'package:mzad_damascus/feature/home/domain/usecase/get_categories_usecase.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_categories_cubit.dart';

/// Eng.Nour Othman(meory)*

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GetCategoriesCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetCategoriesUsecase(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplements(
      remote: sl(),
    ),
  );
  sl.registerLazySingleton<HomeRemote>(() => HomeRemoteImplement());

  sl.registerFactory(() => GetCategoryAttributesCubit(usecase: sl()));
  sl.registerLazySingleton(
      () => GetCategoryAttributesUsecase(repository: sl()));
  sl.registerLazySingleton<AdvertisementRepository>(
    () => AdvertisementRepositoryImpl(
      remote: sl(),
    ),
  );
  sl.registerLazySingleton<AdvertisementRemote>(
      () => AdvertisementRemoteImplement());
}
