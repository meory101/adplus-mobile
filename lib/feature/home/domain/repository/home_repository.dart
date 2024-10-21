import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';


abstract class HomeRepository {
  Future<Either<ApiFailure, GetCategoriesResponseEntity>> getCategories();

}
