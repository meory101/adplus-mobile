import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/add_advertisement_request_entity.dart';
import '../entity/request/delete_adv_request_entity.dart';
import '../entity/request/get_category_attributes_request_entity.dart';
import '../entity/response/currency_response_entity.dart';
import '../entity/response/get_category_attributes_response_entity.dart';
import '../entity/response/get_cities_response_entity.dart';

/// Eng.Nour Othman(meory)*

abstract class AdvertisementRepository {
  Future<Either<ApiFailure, GetCategoryAttributesResponseEntity>>
  getCategoryAttributes({
    required GetCategoryAttributesRequestEntity entity,
  });

  Future<Either<ApiFailure,GetCitiesResponseEntity>> getCities();
  Future<Either<ApiFailure,CurrencyResponseEntity>> getCurrencies();

  Future<Either<ApiFailure, bool>> addAdvertisement(
      {required AddAdvertisementRequestEntity entity, required List<File> files});
  Future<Either<ApiFailure,bool>> updateAdvertisement({required AddAdvertisementRequestEntity entity, required List<File> files});
  Future<Either<ApiFailure,bool>> deleteAdvertisement({required DeleteAdvRequestEntity entity});

}