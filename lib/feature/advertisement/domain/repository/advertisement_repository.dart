import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/get_category_attributes_request_entity.dart';
import '../entity/response/get_category_attributes_response_entity.dart';

/// Eng.Nour Othman(meory)*

abstract class AdvertisementRepository {
  Future<Either<ApiFailure, GetCategoryAttributesResponseEntity>>
      getCategoryAttributes({
    required GetCategoryAttributesRequestEntity entity,
  });
}
