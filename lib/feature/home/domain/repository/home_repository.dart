import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class HomeRepository {
  Future<Either<ApiFailure, GetCategoriesResponseEntity>> getCategories();
  Future<Either<ApiFailure, CategoryInsidePageResponseEntity>> getCategoryInsidePage({required CategoryInsidePageRequestEntity entity});

}
