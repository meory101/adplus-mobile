import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen Baghdadi*

class VerficationUsecase {
  final AuthRepository repository;

  VerficationUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, VerificationResponseEntity>> call(
      {required VerificationRequestEntity entity}) async {
    return await repository.verfication(entity: entity);
  }
}
