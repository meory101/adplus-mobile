import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class DeleteAdvUsecase {
  final AdvertisementRepository repository;

  DeleteAdvUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required DeleteAdvRequestEntity entity}) async {
    return await repository.deleteAdvertisement(entity: entity);
  }
}
