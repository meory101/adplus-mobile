import 'dart:convert';
import 'dart:io';

import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_cities_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../domain/entity/request/add_advertisement_request_entity.dart';
import '../../../domain/entity/request/get_category_attributes_request_entity.dart';

abstract class AdvertisementRemote {
  Future<GetCategoryAttributesResponseEntity> getCategoryAttributes({
    required GetCategoryAttributesRequestEntity entity,
  });

  Future<GetCitiesResponseEntity> getCities();

  Future<bool> addAdvertisement(
      {required AddAdvertisementRequestEntity entity, required List<
          File>files});
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

  @override
  Future<GetCitiesResponseEntity> getCities() async {
    final response = await ApiMethods().get(
        url: ApiGetUrl.getCities);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCitiesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addAdvertisement(
      {required AddAdvertisementRequestEntity entity, required List<
          File> files}) async {
    final response = await ApiMethods().postWithMultiFile(
        data: entity.toJson(),
        files: files,
        url: ApiPostUrl.addAdv);
    print(response.statusCode);
    print(response.body);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }
}