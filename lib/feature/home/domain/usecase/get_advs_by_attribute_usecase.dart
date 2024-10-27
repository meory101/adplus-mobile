import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/advs_by_attribute_request_entity.dart';

/// Eng.Nour Othman(meory)*

class GetAdvsByAttributeUsecase {
  final HomeRepository repository;

  GetAdvsByAttributeUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, AdvsByAttributeResponseEntity>> call({required AdvsByAttributeRequestEntity entity,}) async {
    return await repository.getAdvsByAttribute(entity: entity);
  }
}
