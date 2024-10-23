import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/get_category_attributes_request_entity.dart';

/// Eng.Nour Othman(meory)*

class GetCategoryAttributesUsecase {
  final AdvertisementRepository repository;

  GetCategoryAttributesUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, GetCategoryAttributesResponseEntity>> call({required GetCategoryAttributesRequestEntity entity}) async {
    return await repository.getCategoryAttributes(entity: entity);
  }
}
