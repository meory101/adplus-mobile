import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/item_search_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/item_search_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class ItemSearchUsecase {
  final HomeRepository repository;

  ItemSearchUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, ItemSearchResponseEntity>> call({required ItemSearchRequestEntity entity}) async {
    return await repository.itemSearch(entity: entity);
  }
}
