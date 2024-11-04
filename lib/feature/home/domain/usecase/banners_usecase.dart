import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class BannersUsecase {
  final HomeRepository repository;

  BannersUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, BannersResponseEntity>> call() async {
    return await repository.getBanners();
  }
}
