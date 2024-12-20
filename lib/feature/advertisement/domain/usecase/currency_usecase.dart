import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/currency_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/repository/advertisement_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class CurrencyUsecase {
  final AdvertisementRepository repository;

  CurrencyUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CurrencyResponseEntity>> call() async {
    return await repository.getCurrencies();
  }
}
