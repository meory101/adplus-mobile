import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import '../entity/request/get_category_attributes_request_entity.dart';

/// Eng.Nour Othman(meory)*

class GetCategoryAttributesUsecase {
  final AdvertisementRemote repository;

  GetCategoryAttributesUsecase({
    required this.repository,
  });

  Future<GetCategoryAttributesResponseEntity> call({required GetCategoryAttributesRequestEntity entity}) async {
    return await repository.getCategoryAttributes(entity: entity);
  }
}
