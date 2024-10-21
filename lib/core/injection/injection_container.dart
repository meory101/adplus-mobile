import 'package:get_it/get_it.dart';
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
}
