import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/category_inside_page_request_entity.dart';
import '../entity/response/category_inside_page_response_entity.dart';

/// Eng.Nour Othman(meory)*

class GetCategoryInsidePageUsecase {
  final HomeRepository repository;

  GetCategoryInsidePageUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CategoryInsidePageResponseEntity>> call(
      {required CategoryInsidePageRequestEntity entity}) async {
    return await repository.getCategoryInsidePage(entity: entity);
  }
}
