import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/currency_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/request/add_advertisement_request_entity.dart';
import '../../domain/entity/request/get_category_attributes_request_entity.dart';
import '../../domain/entity/response/get_cities_response_entity.dart';

/// Eng.Nour Othman(meory)*

class AdvertisementRepositoryImpl implements AdvertisementRepository {
  final AdvertisementRemote remote;

  AdvertisementRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetCategoryAttributesResponseEntity>>
      getCategoryAttributes(
          {required GetCategoryAttributesRequestEntity entity}) async {
    return Connector<GetCategoryAttributesResponseEntity>().connect(
      remote: () async {
        final result = await remote.getCategoryAttributes(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, GetCitiesResponseEntity>> getCities() async {
    return Connector<GetCitiesResponseEntity>().connect(
      remote: () async {
        final result = await remote.getCities();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> addAdvertisement(
      {required AddAdvertisementRequestEntity entity,
      required List<File> files}){
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.addAdvertisement(entity: entity,files: files);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> updateAdvertisement({required AddAdvertisementRequestEntity entity, required List<File> files}) async{
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.updateAdvertisement(entity: entity,files: files);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> deleteAdvertisement({required DeleteAdvRequestEntity entity})async {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.deleteAdvertisement(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, CurrencyResponseEntity>> getCurrencies() async{
    return Connector<CurrencyResponseEntity>().connect(
      remote: () async {
        final result = await remote.getCurrencies();
        return Right(result);
      },
    );
  }
}
