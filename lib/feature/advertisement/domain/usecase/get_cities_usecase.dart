import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_cities_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class GetCitiesUsecase {
  final AdvertisementRepository repository;

  GetCitiesUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, GetCitiesResponseEntity>> call() async {
    return await repository.getCities();
  }
}
