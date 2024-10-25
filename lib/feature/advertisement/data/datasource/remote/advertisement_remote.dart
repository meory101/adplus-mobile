import 'dart:convert';

import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../domain/entity/request/get_category_attributes_request_entity.dart';

abstract class AdvertisementRemote {
  Future<GetCategoryAttributesResponseEntity> getCategoryAttributes({
    required GetCategoryAttributesRequestEntity entity,
  });
}

class AdvertisementRemoteImplement extends AdvertisementRemote {
  @override
  Future<GetCategoryAttributesResponseEntity> getCategoryAttributes({
  required GetCategoryAttributesRequestEntity entity}) async {
    final response = await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.getCategoryAttributes);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCategoryAttributesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
