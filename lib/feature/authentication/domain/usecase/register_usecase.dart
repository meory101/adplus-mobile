import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/register_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/register_request_entity.dart';

/// Eng.Hussaen Baghdadi*

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, RegisterResponseEntity>> call(
      {required RegisterRequestEntity entity}) async {
    return await repository.register(entity: entity);
  }
}
