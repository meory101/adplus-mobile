import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/add_advertisement_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class UpdateAdvUsecase {
  final AdvertisementRepository repository;

  UpdateAdvUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required AddAdvertisementRequestEntity entity,required List<File> files}) async {
    return await repository.updateAdvertisement(entity: entity,files: files);
  }
}
