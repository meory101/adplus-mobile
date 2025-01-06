import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/ads_by_category_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/response/ads_by_category_response_entity.dart';

/// Eng.Nour Othman(meory)*

class AdsByCategoryUsecase {
  final HomeRepository repository;

  AdsByCategoryUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, AdsByCategoryResponseEntity>> call({
    required AdsByCategoryRequestEntity entity,
  }) async {
    return await repository.getItemsByCategory(entity: entity);
  }
}
