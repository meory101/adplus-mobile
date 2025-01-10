import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/check_update_availability_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
 
/// Eng.Hussaen Baghdadi()*

class CheckUpdateUsecase {
  final AuthRepository repository;

  CheckUpdateUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CheckUpdateAvailabilityResponseEntity>> call(
      {entity}) async {
    return await repository.checkupdate(entity: entity);
  }
}
